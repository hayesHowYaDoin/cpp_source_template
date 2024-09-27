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

bool
Toggler::toggle()
{
    m_impl->value = !m_impl->value;

    return m_impl->value;
}

} // namespace example