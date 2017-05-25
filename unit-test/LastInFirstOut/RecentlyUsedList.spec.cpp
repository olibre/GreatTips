// Copyright (c) 2016 Kevlin Henney

#include "recently_used_list.hpp"
#include <gtest/gtest.h>
#include <stdexcept>

using namespace ::testing;

TEST(A_new_list, is_empty)
{
    // When:
    const recently_used_list new_list;
    // Then:
    ASSERT_TRUE(new_list.empty());
    ASSERT_EQ(0, new_list.size());
}

TEST(An_empty_list, retains_single_item_insertion)
{
    // Given:
    recently_used_list new_list;
    const std::string insertion { "Paris" };
    // When:
    new_list.insert(insertion);
    // Then:
    ASSERT_FALSE(new_list.empty());
    ASSERT_EQ(1, new_list.size());
    ASSERT_EQ(insertion, new_list[0]);
}

TEST(An_empty_list, retains_distinct_item_insertions_in_reverse)
{
    // Given:
    recently_used_list new_list;
    const std::string insertion[] { "Paris", "Bristol", "Budapest" };
    // When:
    new_list.insert(insertion[0]);
    new_list.insert(insertion[1]);
    new_list.insert(insertion[2]);
    // Then:
    ASSERT_EQ(3, new_list.size());
    ASSERT_EQ(insertion[2], new_list[0]);
    ASSERT_EQ(insertion[1], new_list[1]);
    ASSERT_EQ(insertion[0], new_list[2]);
}

TEST(A_non_empty_list, is_unchanged_when_head_item_reinserted)
{
    // Given:
    recently_used_list new_list;
    const std::string insertion[] { "Copenhagen", "Cairo" };
    new_list.insert(insertion[0]);
    new_list.insert(insertion[1]);
    // When:
    new_list.insert(insertion[1]);
    // Then:
    ASSERT_EQ(2, new_list.size());
    ASSERT_EQ(insertion[1], new_list[0]);
    ASSERT_EQ(insertion[0], new_list[1]);
}

TEST(A_non_empty_list, moves_non_head_reinsertions_to_head)
{
    // Given:
    recently_used_list new_list;
    const std::string insertion[] { "Paris", "Bristol", "Budapest" };
    new_list.insert(insertion[0]);
    new_list.insert(insertion[1]);
    new_list.insert(insertion[2]);
    // When:
    new_list.insert(insertion[1]);
    // Then:
    ASSERT_EQ(3, new_list.size());
    ASSERT_EQ(insertion[1], new_list[0]);
    ASSERT_EQ(insertion[2], new_list[1]);
    ASSERT_EQ(insertion[0], new_list[2]);
}

TEST(Any_list, rejects_insertion_of_empty_items)
{
    // Given:
    recently_used_list list;
    list.insert("Paris");
    // When/Then:
    ASSERT_THROW(list.insert(""), std::invalid_argument);
    // Then:
    ASSERT_EQ(1, list.size());
}
