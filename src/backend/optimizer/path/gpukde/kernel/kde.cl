__kernel void range_kde(
	__global const float* const data,
	__global float* const result,
	__global const float* const input,
	__global const float* const bandwidth
) {
	if (get_global_id(0) >= SAMPLE_SIZE)
		return;
	float res = 1.0f;
	for (unsigned int i=0; i<D; ++i) {
		// Fetch all required input data.
		float val = data[D*get_global_id(0) + i];
		float h = bandwidth[i];
		float lo = input[2*i];
		float up = input[2*i + 1];
		// If the support is completely contained in the query, the result is exactly 1.0f. 
		char is_one = (lo <= (val-h)) && (up >= (val+h));
		// Adjust the boundaries, so we only integrate over the defined area.
		lo = max(lo, val-h);
		up = min(val+h, up);
		// ... and compute the local contribution from this dimension:
		float local_result = (h*h - val*val)*(up - lo);
		local_result += val * (up*up - lo*lo);
		local_result -= (up*up*up - lo*lo*lo) / 3.0f; 
		local_result /= h*h*h;
		// Apply the boundary cases: 
		res *= is_one ? 1.0f : (lo < up)*local_result;
	}
	result[get_global_id(0)] = res;
}

__kernel void exact_kde(
	__global const float* const data,
	__global float* const result,
	__global const float* const input
) {
	if (get_global_id(0) >= SAMPLE_SIZE)
		return;
	float res = 1.0f;
	for (unsigned int i=0; i<D; ++i) {
		float val = data[D*get_global_id(0) + i];
		float lo = input[2*i];
		float up = input[2*i + 1];
		res *= (val>=lo)*(val<=up);
	}
	result[get_global_id(0)] = res;
}
