
void DoCurve_float(float3 vertexPos, out float3 result)
{
    float t = Remap(0, _XLength, 0, 1, vertexPos.x);
    float3 worldPos = mul(unity_ObjectToWorld, vertexPos);
    worldPos.y +=  _Amplitude * sin(t * _Frequency );
    float3 vertexLocalPos = mul(unity_WorldToObject, worldPos);
    result = vertexLocalPos;
}