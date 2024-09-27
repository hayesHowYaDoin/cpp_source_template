#include "example/example.h"
#include "example_p.h"

#include <iostream>
#include <vector>

namespace example {

Toggler::Toggler(bool initialValue)
    : m_impl{std::make_unique<TogglerImpl>(initialValue)} {
    // Intentionally blank
}

auto Toggler::toggle() -> bool {
    m_impl->value = !m_impl->value;

    std::vector<int> formattedVector {1, 2, 3, 4, 5, 65, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 76, 9};

    return m_impl->value;
}

} // namespace example