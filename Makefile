# CUDA-specific variables
CUDAFLAGS = -O3
NVCC = nvcc
CXXFLAGS = -I.  # Add current directory to the include path

# Rule to compile the main program (compile both nbody.cpp and cuda.cu with nvcc)
nbody: nbody.cu cuda.cu
	$(NVCC) $(CUDAFLAGS) $(CXXFLAGS) nbody.cu cuda.cu -o nbody

solar.out: nbody
	date
	./nbody planet 200 5000000 10000 > solar.out
	date

solar.pdf: solar.out
	python3 plot.py solar.out solar.pdf 1000

random.out: nbody
	date
	./nbody 1000 1 10000 100 > random.out
	date

