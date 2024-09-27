#include <gtest/gtest.h>

#include "example/example.h"

TEST(ExampleTest, TogglerTest)
{
    example::Toggler toggler(false);

    EXPECT_TRUE(toggler.toggle());
    EXPECT_FALSE(toggler.toggle());
    EXPECT_TRUE(toggler.toggle());
}