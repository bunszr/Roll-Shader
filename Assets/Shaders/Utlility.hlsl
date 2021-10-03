float InverseLerp(float from, float to, float value) 
{
    return (value - from) / (to - from);
}

float Remap(float origFrom, float origTo, float targetFrom, float targetTo, float value)
{
    float rel = InverseLerp(origFrom, origTo, value);
    return lerp(targetFrom, targetTo, rel);
}