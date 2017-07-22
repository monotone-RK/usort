
binUtils.o: src/binUtils.cpp include/binUtils.h
	mpicxx -D_PROFILE_SORT -I./include -std=c++11 -fopenmp -c src/binUtils.cpp

parUtils.o: src/parUtils.cpp include/parUtils.h
	mpicxx -D_PROFILE_SORT -I./include -std=c++11 -fopenmp -c src/parUtils.cpp

sort_profiler.o: src/sort_profiler.cpp include/sort_profiler.h
	mpicxx -D_PROFILE_SORT -I./include -std=c++11 -fopenmp -c src/sort_profiler.cpp

main:	parUtils.o binUtils.o sort_profiler.o src/main.cpp
	mpicxx -D_PROFILE_SORT -I./include -std=c++11 -fopenmp src/main.cpp binUtils.o parUtils.o sort_profiler.o -o main 

clean:
	rm -f *.o main
