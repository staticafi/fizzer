#include <squirrel/gfx/math.hpp>
#include <utility/assumptions.hpp>

namespace gfx {

vec2 nearest_point_on_rect_to_point(Rect const& rect, vec2 const& point)
{
    return vec2 {
        std::max(rect.left_top.x, std::min(point.x, rect.right_bottom.x)),
        std::max(rect.left_top.y, std::min(point.y, rect.right_bottom.y))
    };
}


std::pair<vec2, vec2> nearest_points_of_rects(Rect const& r1, Rect const& r2)
{
    vec2 np1 = nearest_point_on_rect_to_point(r1, center(r2));
    vec2 np2 = nearest_point_on_rect_to_point(r2, np1);
    return { np1, np2 };
}


bool solve_quadratic_equation(vec2& roots, float const a, float const b, float const c)
{
    ASSUMPTION(std::fabs(a) > 0.0001f);

    float const D = b*b - 4.0f*a*c;
    if (D < 0.0f)
        return false;
    float const D_sqrt = std::sqrt(D);
    roots.x = (-b - D_sqrt) / (2.0f * a);
    roots.y = (-b + D_sqrt) / (2.0f * a);
    return true;
}


vec2 collision_constraint_force(vec2 const& pos1, float const rad1, vec2 const& pos2, float const rad2)
{
    ASSUMPTION(rad1 >= 0.0f && rad2 >= 0.0f);

    vec2 dpos = pos2 - pos1;
    float current_dist = dpos.length();
    float const collision_dist = rad1 + rad2;
    if (current_dist >= collision_dist)
        return vec2::zero();
    if (current_dist < 0.0001f)
    {
        current_dist = 0.0001f;
        dpos = vec2{ current_dist, 0.0f };
    }
    vec2 const X = dpos / current_dist;
    float const dist_delta = collision_dist - current_dist;
    return (-2.0f * dist_delta * dist_delta) * X;
}


vec2 distance_constraint_force(vec2 const& pos1, float rad1, vec2 const& pos2, float rad2, float const neutral_distance)
{
    ASSUMPTION(neutral_distance >= 0.0f && rad1 >= 0.0f && rad2 >= 0.0f);

    vec2 dpos = pos2 - pos1;
    float current_dist = dpos.length();
    if (current_dist < 0.0001f)
        return vec2::zero();
    vec2 const X = dpos / current_dist;
    float const desired_dist = neutral_distance + rad1 + rad2;
    float const dist_delta = desired_dist - current_dist;
    return ((dist_delta < 0.0f ? 1.0f : -1.0f) * dist_delta * dist_delta) * X;
}


}
