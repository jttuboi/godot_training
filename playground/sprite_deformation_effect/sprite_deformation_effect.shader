shader_type canvas_item;

uniform vec2 deformation = vec2(0, 0);
uniform float sideWaysDeformationFactor = 5.0;
uniform float knockbackFactor = 0.4;

void vertex() {
	vec2 deformationStrength = abs(deformation);
	float sideWaysDeformation = min(deformationStrength.x, deformationStrength.y);
	float spriteWidth = abs(VERTEX.x);
	if (sign(VERTEX.y) != sign(deformation.y)) {
		VERTEX.x += sideWaysDeformation * sideWaysDeformationFactor * spriteWidth * sign(deformation.x);
	}
	vec2 scale = 1.0 - deformationStrength;
	
	vec2 vertexOld = VERTEX;
	VERTEX.x = vertexOld.x * scale.x / scale.y;
	VERTEX.y = vertexOld.y * scale.y / scale.x;
	VERTEX.xy += deformation * spriteWidth * knockbackFactor;
}