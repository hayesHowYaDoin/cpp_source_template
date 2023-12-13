#include <gtest/gtest.h>
#include <example/example.hpp>

TEST(ToggleTest, ToggleTrueToFalse)
{
    EXPECT_FALSE(false);
}

TEST(ToggleTest, ToggleFalseToTrue)
{
    EXPECT_TRUE(true);
}
