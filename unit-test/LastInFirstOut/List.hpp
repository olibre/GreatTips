#ifndef LIST_HPP_
#define LIST_HPP_

#include <deque>
#include <string>
#include <algorithm>

class List
{
    public:
        bool empty() const { return true; }
        std::string operator[](int index) const { return _list[index];}

        void add(const std::string& value) {
            auto it = std::find(_list.begin(), _list.end(), value);
            if (it==_list.end())
                _list.push_back(value);
            else
                 std::move(it, it, _list.end());
        }
        std::string first() const { return _list.back(); }
        std::string last() const { return _list.front();}
        size_t size() const {return _list.size();}

    private:
        std::deque<std::string> _list;
};

#endif
