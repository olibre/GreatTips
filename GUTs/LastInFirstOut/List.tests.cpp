#include "hiker.hpp"
#include <gtest/gtest.h>

using namespace ::testing;

/*
Develop a recently-used-list class to hold strings 
uniquely in Last-In-First-Out order.
o) A recently-used-list is initially empty.
o) The most recently added item is first, the least
   recently added item is last.
o) Items can be looked up by index, which counts from zero.
o) Items in the list are unique, so duplicate insertions
   are moved rather than added.
Optional extras
o) Null insertions (empty strings) are not allowed.
o) A bounded capacity can be specified, so there is an upper
   limit to the number of items contained, with the least
   recently added items dropped on overflow.
*/


TEST(List_is_at_initial_state, if_is_empty)
{
    List list;
    ASSERT_TRUE(list.empty());
}

TEST(The_first_item, is_the_most_recently_added)
{
    List list;
    list.add("hello1");
    list.add("hello2");
    list.add("hello3");
    ASSERT_EQ(list.first(),"hello3");
}

TEST(The_last_item, is_the_least_recently_added)
{
    List list;
    list.add("hello1");
    list.add("hello2");
    list.add("hello3");
    ASSERT_EQ(list.last(),"hello1");
}

// Items can be looked up by index, which counts from zero.
TEST(The_last_item, is_the_index_zero)
{
    List list;
    list.add("hello1");
    list.add("hello2");
    list.add("hello3");
    ASSERT_EQ(list[0],"hello1");
}
TEST(The_first_item, is_the_index_Nth)
{
    List list;
    list.add("hello1");
    list.add("hello2");
    list.add("hello3");
    ASSERT_EQ(list[2],"hello3");
}


// Items in the list are unique, so duplicate insertions 
//   are moved rather than added.

TEST(Each_item, is_unique)
{
    List list;
    list.add("hello1");
    list.add("hello1");
    list.add("hello1");
    list.add("hello1");
    ASSERT_EQ(list.first(),"hello1");
    ASSERT_EQ(list.last(),"hello1");
    ASSERT_EQ(list.size(),1);
}

TEST(The_duplicate_item, is_first_item)
{
    List list;
    list.add("hello1");
    list.add("hello2");
    list.add("hello3");
    list.add("hello2");
    ASSERT_EQ(list[2],"hello3");
}



