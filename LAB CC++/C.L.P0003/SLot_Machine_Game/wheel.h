#ifndef WHEEL_H_INCLUDED
#define WHEEL_H_INCLUDED

class wheel {
public:
        wheel();
        void update();
        int get_first();
        int get_second();
        int get_third();
private:
        int cycle[10];
        int place_tracker;


};

#endif // WHEEL_H_INCLUDED
