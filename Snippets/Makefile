CXX=g++-8
STD=-std=c++2a
CXXFLAGS=-Wall -Werror -c
LDLIBS=-lstdc++fs 

all: buildAndRun 

buildAndRun: buildAll run

run: $(EXECUTABLES)
	for i in $(EXECUTABLES); do ./$$i; done

buildAll: compile link

OBJS:= $(patsubst %.cpp, %.o, $(wildcard *.cpp))
TARGETS:= $(patsubst %.cpp, %.out, $(wildcard *.cpp))
EXECUTABLES:= $(patsubst %.cpp, %, $(wildcard *.cpp))

compile: $(OBJS)

link: compile $(TARGETS)
	rm *.o

%.out: %.o Makefile
	$(CXX) $< -o $(@:.out=) $(LDLIBS) 

%.o: %.cpp Makefile
	$(CXX) $(STD) $(CXXFLAGS) $< -o $@

clean: $(patsubst %.cpp, %.clean, $(wildcard *.cpp))

%.clean:
	rm -f $(@:.clean=)
