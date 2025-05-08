CXXFLAGS = -O3

CUDAFLAGS = -O3
NVCC = nvcc

nbody: nbody.cu
	$(NVCC) $(CUDAFLAGS) nbody.cu -o nbody

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
