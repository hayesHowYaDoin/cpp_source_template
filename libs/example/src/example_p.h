#ifndef EXAMPLE_P_H
#define EXAMPLE_P_H

namespace example {

struct TogglerImpl {
    explicit TogglerImpl(bool value) : value(value) {}
    bool value;
};

} // namespace example

#endif // EXAMPLE_P_H