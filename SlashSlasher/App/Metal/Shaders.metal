//
//  Shaders.metal
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

#include <metal_stdlib>
using namespace metal;

#include "Definitions.h"

struct Fragment {
    float4 position [[position]];
    float4 color;
};

vertex Fragment vertexShader(
     const device Vertex *vertexArray[[ buffer(0) ]],
     unsigned int vid [[vertex_id]],
     constant matrix_float4x4 &model [[ buffer(1) ]]
 ) {
    Vertex input = vertexArray[vid];
    
    Fragment output;
    output.position = model * float4(input.position.x, input.position.y, 0, 1);
    output.color = input.color;
    
    return output;
}

fragment float4 fragmentShader(Fragment input [[stage_in]]) {
    return input.color;
}

