#include "stream_reassembler.hh"

#include <cassert>

// Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in `stream_reassembler.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&.../* unused */) {}

using namespace std;

StreamReassembler::StreamReassembler(const size_t capacity)
    : _buf(), _next_assembled_idx(0), _unassembled_bytes_num(0), _eof_idx(0), _output(capacity), _capacity(capacity) {}

//! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
void StreamReassembler::push_substring(const string &data, const size_t index, const bool eof) {
    if (eof) {
        _eof = true;
        _eof_idx = index + data.length();
    }

    if (first_unassembled() > index) {
        if (index + data.length() <= first_unassembled())
            return;
        else {
            push_substring(data.substr(first_unassembled() - index), first_unassembled(), eof);
            return;
        }
    }

    if (first_unassembled() == index) {
        _output.write(data);
        reassemble(old_first_unassembled, old_first_unacceptable);
    } else {
        put_in_buf(data, index);
    }
    if (_eof && first_unassembled() == _eof_idx) {
        _buf.clear();
        _output.end_input();
    }
}

size_t StreamReassembler::unassembled_bytes() const { return _unassembled_bytes_num; }

bool StreamReassembler::empty() const { return _buf.empty(); }
size_t StreamReassembler::first_unread() { return _output.bytes_read(); }
size_t StreamReassembler::first_unassembled() { return _output.bytes_written(); }
size_t StreamReassembler::first_unacceptable() { return _output.bytes_read() + _capacity; }
void StreamReassembler::reassemble(size_t old_first_unassemble, size_t old_first_unacceptable) {
    string s = string();
    for (size_t i = old_first_unassemble; i < old_first_unacceptable; ++i) {
        if (_buf.find(i) != _buf.end()) {
            if (i < first_unassembled()) {
                _buf.erase(i);
                continue;
            }
            if (i == first_unassembled() + s.length()) {
                s.push_back(_buf.at(i));
                _buf.erase(i);
            } else
                break;
        }
    }
    _output.write(s);
}
void StreamReassembler::put_in_buf(const string &data, const size_t index) {
    for (size_t i = 0; i < data.length(); ++i) {
        if (index + i < first_unacceptable())
            _buf.insert(std::pair<size_t, char>(index + i, data[i]));
        else
            continue;
    }
}