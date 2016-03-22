float dot_product(float *v1, float *v2, int length)
{
    int i;
    float retval = 0;
    for (i = 0; i < length; ++i)
    {
        retval += v1[i] * v2[i];
    }
    return retval;
}
