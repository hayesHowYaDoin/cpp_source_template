#ifndef EXAMPLE_TOGGLER_IMPL_H
#define EXAMPLE_TOGGLER_IMPL_H

namespace example
{

class TogglerImpl
{
  public:
    explicit TogglerImpl(bool initialValue) : m_state{ initialValue } {}

    bool
    toggle()
    {
        m_state = !m_state;
        return m_state;
    }

  private:
    bool m_state;
};

} // namespace example

#endif // EXAMPLE_TOGGLER_IMPL_H