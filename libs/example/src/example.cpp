#include "example/example.h"
#include "example_p.h"

#include <iostream>
#include <vector>

namespace example
{

Toggler::Toggler(bool initialValue)
    : m_impl{ std::make_unique<TogglerImpl>(initialValue) }
{
    // Intentionally blank
}

Toggler::~Toggler() = default;

bool
Toggler::toggle()
{
    return m_impl->toggle();
}

} // namespace example