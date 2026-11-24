#version 450

// A row_major float matrix array inside a std140 uniform block.
// Reflection JSON and generated GLSL must agree on the exact layout:
// the matrix array starts at offset 0 with array_stride 64, and the
// following member lands at offset 96.
layout(set = 0, binding = 0, std140, row_major) uniform Block
{
	mat4 a[1];
	layout(offset = 96) vec4 b;
};

layout(location = 0) in vec4 in_pos;
layout(location = 0) out vec4 out_pos;

void main()
{
	out_pos = in_pos + b + a[0][0];
}
