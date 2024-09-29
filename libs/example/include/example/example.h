#ifndef EXAMPLE_EXAMPLE_H
#define EXAMPLE_EXAMPLE_H

#include <memory>

namespace example
{

class TogglerImpl;

class Toggler
{
  public:
    explicit Toggler(bool initialValue);

    ~Toggler();

    bool toggle();

  private:
    std::unique_ptr<TogglerImpl> m_impl;
};

} // namespace example

#endif // EXAMPLE_EXAMPLE_H