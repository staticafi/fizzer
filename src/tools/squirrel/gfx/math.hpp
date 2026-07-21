#ifndef TOOL_SQUIRREL_GFX_MATH_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_MATH_HPP_INCLUDED

#   include <cmath>
#   include <utility>
#   include <imgui.h>

namespace gfx {


struct vec2
{
    vec2() = default;
    vec2(auto const x_, auto const y_) : x{ (float)x_ }, y{ (float)y_ } {}
    vec2(vec2 const& ) = default;
    vec2(vec2&& ) = default;
    vec2& operator=(vec2 const& ) = default;
    vec2& operator=(vec2&& ) = default;

    vec2(ImVec2 const& v) : x{ v.x }, y{ v.y } {}
    operator ImVec2() const { return ImVec2{ x, y }; }

    inline static vec2 zero() { return vec2{ 0.0f, 0.0f }; }
    inline static vec2 axis_x() { return vec2{ 1.0f, 0.0f }; }
    inline static vec2 axis_y() { return vec2{ 0.0f, 1.0f }; }

    vec2& operator+=(vec2 const& u) { x += u.x; y += u.y; return *this; }
    vec2& operator-=(vec2 const& u) { x -= u.x; y -= u.y; return *this; }
    vec2& operator*=(auto const a) { x *= a; y *= a; return *this; }
    vec2& operator/=(auto const a) { x /= a; y /= a; return *this; }

    float length() const { return std::sqrt(x*x + y*y); }
    void normalize() { *this /= length(); }

    float x;
    float y;
};

inline vec2 operator+(vec2 const& u, vec2 const& v) { return vec2{ u.x + v.x, u.y + v.y }; }
inline vec2 operator-(vec2 const& u, vec2 const& v) { return vec2{ u.x - v.x, u.y - v.y }; }
inline vec2 operator-(vec2 const& u) { return vec2{ -u.x, -u.y }; }
inline float operator*(vec2 const& u, vec2 const& v) { return u.x * v.x + u.y * v.y; }
inline vec2 operator*(auto const a, vec2 const& u) { return vec2{ a * u.x, a * u.y }; }
inline vec2 operator*(vec2 const& u, auto const a) { return vec2{ a * u.x, a * u.y }; }
inline vec2 operator/(vec2 const& u, auto const a) { return vec2{ u.x / a, u.y / a }; }

inline float length(vec2 const& u) { return u.length(); }
inline vec2 normalized(vec2 const& u) { return u / length(u); }

inline vec2 orthogonal_ccw(vec2 const& u) { return vec2{ -u.y, u.x }; }

inline vec2 avg(vec2 const& a, vec2 const& b) { return 0.5f * (a + b); }

inline bool equal(vec2 const& a, vec2 const& b, float epsilon = 1e-4f)
{ vec2 d = b - a; float x = d*d; return x < epsilon*epsilon; }


struct Rect
{
    vec2 left_top;
    vec2 right_bottom;
};

inline vec2 center(Rect const& rect) { return avg(rect.left_top, rect.right_bottom); }
inline float radius(Rect const& rect) { return 0.5f * (rect.left_top - rect.right_bottom).length(); }

inline Rect make_rect_from_center_and_half_size(vec2 const& center, vec2 const& half_size)
{ return Rect{ .left_top = center - half_size, .right_bottom = center + half_size }; }

inline Rect make_rect_from_line(vec2 const& a, vec2 const& b)
{ return Rect{ .left_top = vec2{ std::min(a.x, b.x), std::min(a.y, b.y) }, .right_bottom = vec2{ std::max(a.x, b.x), std::max(a.y, b.y) } }; }

inline Rect move_rect(Rect const& rect, vec2 const& shift)
{ return Rect{ .left_top = rect.left_top + shift, .right_bottom = rect.right_bottom + shift }; }

inline bool collision(Rect const& r, vec2 const& p)
{return r.left_top.x <= p.x && p.x <= r.right_bottom.x && r.left_top.y <= p.y && p.y <= r.right_bottom.y; }

bool collision(Rect const& r1, Rect const& r2);

vec2 nearest_point_on_rect_to_point(Rect const& rect, vec2 const& point);
std::pair<vec2, vec2> nearest_points_of_rects(Rect const& r1, Rect const& r2);

bool solve_quadratic_equation(vec2& roots, float a, float b, float c);

vec2 collision_constraint_force(vec2 const& pos1, float rad1, vec2 const& pos2, float rad2);

inline vec2 collision_constraint_force(Rect const& rect1, Rect const& rect2)
{ return collision_constraint_force(center(rect1), radius(rect1), center(rect2), radius(rect2)); }

vec2 distance_constraint_force(vec2 const& pos1, float rad1, vec2 const& pos2, float rad2, float neutral_distance);

inline vec2 distance_constraint_force(Rect const& rect1, Rect const& rect2, float neutral_distance)
{ return distance_constraint_force(center(rect1), radius(rect1), center(rect2), radius(rect2), neutral_distance); }

inline vec2 snap_constraint_force(vec2 const& pos, vec2 const& snap)
{ return distance_constraint_force(pos, 0.0f, vec2::zero(), 0.0f, 0.0f); }

inline vec2 snap_constraint_force(Rect const& rect, vec2 const& snap)
{ return snap_constraint_force(center(rect), snap); }

inline vec2 viscous_drag_force(vec2 const& obj_velo, float drag_coeff, vec2 const& env_velo = vec2::zero())
{ return drag_coeff * (env_velo - obj_velo); }

}

#endif
