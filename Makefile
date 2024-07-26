PREFIX = /opt/homebrew/opt/gsl
CC = g++
CXXFLAGS = -I$(PREFIX)/include
LDFLAGS = -L$(PREFIX)/lib -lgsl -lgslcblas -lm

LSOURCE = main.cpp corpus.cpp slda.cpp utils.cpp opt.cpp
LOBJECTS = main.o corpus.o slda.o utils.o opt.o
LHEADER = corpus.h slda.h utils.h opt.h settings.h

slda: $(LOBJECTS)
	$(CC) -o $@ $(LOBJECTS) $(LDFLAGS)

%.o: %.cpp $(LHEADER)
	$(CC) $(CXXFLAGS) -c $< -o $@

clean:
	-rm -f *.o slda