static const float startAngle = 90;

#include "Utlility.hlsl"

void DoRoll_float(float3 vertexPos, out float3 result)
{
    // // Rulo efekti
    if (_RollCenterPosX > vertexPos.x)
    {
        float angleRadian = radians(startAngle + abs(vertexPos.x - _RollCenterPosX) * _Spin);
        float3 centerPoint = float3(_RollCenterPosX, vertexPos.y, 0); // Rulomuzu döndürmek için merkez pozisyon
        float incrementalRadius = Remap(0, _XLength, 1, 3, vertexPos.x) + vertexPos.z; // vertex.z ile toplamamızın sebebi x'leri aynı olan vertexlerin radiyuslarının farklı olması
        vertexPos = centerPoint + float3(cos(angleRadian), 0, sin(angleRadian)) * incrementalRadius;

        // Max radiyusu bulup öteliyoruz
        float maxRadius = Remap(0, _XLength, 1, 3, _RollCenterPosX);
        vertexPos.z -= maxRadius;
    }

    // // bombe efekti
    vertexPos.z += -1.5 * sin(InverseLerp(0, _YLength, vertexPos.y) * 3.15) * _Bump;

    result = vertexPos;
}