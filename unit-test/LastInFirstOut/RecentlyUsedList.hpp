// Copyright (c) 2016 Kevlin Henney

#ifndef RECENTLY_USED_LIST_HPP_
#define RECENTLY_USED_LIST_HPP_

#include <algorithm>
#include <deque>
#include <stdexcept>
#include <string>

class recently_used_list
{
public:
    bool empty() const
    {
        return items.empty();
    }
    std::size_t size() const
    {
        return items.size();
    }
    void insert(const std::string & new_item)
    {
        if (new_item.empty())
            throw std::invalid_argument("insert must be of non-empty item");

        auto found = std::find(items.begin(), items.end(), new_item);
        if(found != items.end())
            items.erase(found);

        items.push_front(new_item);
    }
    std::string operator[](std::size_t index) const
    {
        return items[index];
    }
private:
    std::deque<std::string> items;
};

#endif
