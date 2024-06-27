#include "tcp_receiver.hh"

#include "tcp_state.hh"

#include <cassert>

// Dummy implementation of a TCP receiver

// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

template <typename... Targs>
void DUMMY_CODE(Targs &&.../* unused */) {}

using namespace std;

/**
 *  \brief 当前 TCPReceiver 大体上有三种状态， 分别是
 *      1. LISTEN，此时 SYN 包尚未抵达。可以通过 _set_syn_flag 标志位来判断是否在当前状态
 *      2. SYN_RECV, 此时 SYN 抵达。只能判断当前不在 1、3状态时才能确定在当前状态
 *      3. FIN_RECV, 此时 FIN 抵达。可以通过 ByteStream end_input 来判断是否在当前状态
 */

void TCPReceiver::segment_received(const TCPSegment &seg) {
    if (!_isn.has_value()) {
        if (seg.header().syn) {
            _isn = seg.header().seqno;
            _reassembler.push_substring(seg.payload().copy(), 0, seg.header().fin);
            update_ack_no();
        }
        return;
    }
    uint64_t abs_sqeno = unwrap(seg.header().seqno, _isn.value(), _reassembler.first_unassembled());
    _reassembler.push_substring(seg.payload().copy(), abs_sqeno - 1, seg.header().fin);
    update_ack_no();
}

optional<WrappingInt32> TCPReceiver::ackno() const { return _ackno; }

size_t TCPReceiver::window_size() const { return _capacity - _reassembler.stream_out().buffer_size(); }

void TCPReceiver::update_ack_no() {
    //+1 因为syn算一个byte
    //+2 因为fin也算一个byte
    if (_reassembler.stream_out().input_ended())
        _ackno = wrap(_reassembler.first_unassembled() + 2, _isn.value());
    else
        _ackno = wrap(_reassembler.first_unassembled() + 1, _isn.value());
}

string TCPReceiver::state() {
    if (_reassembler.stream_out().error())
        return TCPReceiverStateSummary::ERROR;

    if (_isn.has_value())
        return TCPReceiverStateSummary::SYN_RECV;

    if (_reassembler.stream_out().input_ended())
        return TCPReceiverStateSummary::FIN_RECV;

    return TCPReceiverStateSummary::LISTEN;
}