#include <iostream>

extern "C" void AreaCalculation(double R, double *A);
extern "C" void VolumeCalculation(double R, double *V);


using namespace std;

int main()
{
	double Rayon = 2;
	double resultArea = 0;
	double resultVolume = 0;

	AreaCalculation(Rayon, &resultArea);
	VolumeCalculation(Rayon, &resultVolume);
	
	cout << "Valeur Aire : " << resultArea << endl << "Valeur Volume : " << resultVolume;

	return 0;
}
