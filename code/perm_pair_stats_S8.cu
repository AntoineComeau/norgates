/*
0:6
1:18
2:18
3:6
4:36
5:162
6:252
7:396
8:972
9:3648
10:6792
11:10770
12:17244?
 */



#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <math.h>
#include <ctime>

#define _USE_MATH_DEFINES

static int* gpupermlist = 0;
static int* gpuperm1 = 0;
static int* gpuperm2 = 0;
static int* gpuperm3 = 0;
static int* gpupermcost = 0;
static bool* gpulistlookup = 0;
static int* gpulist = 0;
static int* gpurline = 0;
static int* gpulline = 0;

void perm(int k, int* permuted);
int perminv(int k);
int inv(int* perm);
int conj(int k, int a, int b);

int* permlist = new int[40320];
int* perm1 = new int[40320];
int* perm2 = new int[40320];
int* perm3 = new int[40320];
int* permcost = new int[40320];
bool* permcheck = new bool[40320];

__global__ void gates7(int* gpupermlist, int* gpuperm1, int* gpuperm2, int* gpuperm3, int* gpupermcost, int permcount, int* gpurline, int* gpulline)
{
	int i;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 1620 * 28 * 21 * 15 * 10 * 6) return;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;

	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;


	int gpulist2[14] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;

	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;

	for (i = 0; i < permcount; i++)
	{
		if (gpulistlookup2[gpuperm1[i]] && gpulistlookup2[gpuperm2[i]] && gpulistlookup2[gpuperm3[i]])
		{
			gpupermcost[gpupermlist[i]] = 7;
		}
	}
}

__global__ void gates8(int* gpupermlist, int* gpuperm1, int* gpuperm2, int* gpuperm3, int* gpupermcost, int permcount, int* gpurline, int* gpulline)
{
	int i, a7;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 45 * 36 * 28 * 21 * 15 * 10 * 6) return;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;


	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;

	int gpulist2[14] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;
	gpulist2[9] = 255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;

	for (a7 = a6 + 1; a7 < 55; a7++)
	{
		if (!(gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])]))
		{
			gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = true;

			for (i = 0; i < permcount; i++)
			{
				if (gpulistlookup2[gpuperm1[i]] && gpulistlookup2[gpuperm2[i]] && gpulistlookup2[gpuperm3[i]])
				{
					gpupermcost[gpupermlist[i]] = 8;
				}
			}

			gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = false;
		}
	}
}

__global__ void gates9(int* gpupermlist, int* gpuperm1, int* gpuperm2, int* gpuperm3, int* gpupermcost, int permcount, int* gpurline, int* gpulline)
{
	int i;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 45 * 36 * 28 * 21 * 15 * 10 * 6) return;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;

	int a7;
	int a8;

	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;

	int gpulist2[14] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;
	gpulist2[9] = 255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;

	for (a7 = a6 + 1; a7 < 55; a7++)
	{
		for (a8 = a7 + 1; a8 < 66; a8++)
		{
			if (!gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])])
			{

				gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = true;
				gpulist2[10] = 255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]]);

				if (!gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])])
				{
					gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = true;

					for (i = 0; i < permcount; i++)
					{
						if (gpulistlookup2[gpuperm1[i]] && gpulistlookup2[gpuperm2[i]] && gpulistlookup2[gpuperm3[i]])
						{
							gpupermcost[gpupermlist[i]] = 9;
						}
					}

					gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = false;
				}
				gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = false;
			}
		}
	}
}

__global__ void gates10(int* gpupermlist, int* gpuperm1, int* gpuperm2, int* gpuperm3, int* gpupermcost, int permcount, int* gpurline, int* gpulline)
{
	int i;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 45 * 36 * 28 * 21 * 15 * 10 * 6) return;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;

	int a7;
	int a8;
	int a9;

	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;

	int gpulist2[14] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;
	gpulist2[9] = 255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;

	for (a7 = a6 + 1; a7 < 55; a7++)
	{
		for (a8 = a7 + 1; a8 < 66; a8++)
		{
			for (a9 = a8 + 1; a9 < 78; a9++)
			{
				if (!gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])])
				{
					gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = true;
					gpulist2[10] = 255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]]);
					if (!gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])])
					{
						gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = true;
						gpulist2[11] = 255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]]);
						if (!gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])])
						{
							gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = true;

							for (i = 0; i < permcount; i++)
							{
								if (gpulistlookup2[gpuperm1[i]] && gpulistlookup2[gpuperm2[i]] && gpulistlookup2[gpuperm3[i]])
								{
									gpupermcost[gpupermlist[i]] = 10;
								}
							}
							gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = false;
						}
						gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = false;
					}
					gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = false;
				}
			}
		}
	}
}

__global__ void gates11(int* gpupermlist, int* gpuperm1, int* gpuperm2, int* gpuperm3, int* gpupermcost, int permcount, int* gpurline, int* gpulline)
{
	int i;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 45 * 36 * 28 * 21 * 15 * 10 * 6) return;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;

	int a7;
	int a8;
	int a9;
	int a10;

	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;

	int gpulist2[14] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;
	gpulist2[9] = 255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;

	for (a7 = a6 + 1; a7 < 55; a7++)
	{
		for (a8 = a7 + 1; a8 < 66; a8++)
		{
			for (a9 = a8 + 1; a9 < 78; a9++)
			{
				for (a10 = a9 + 1; a10 < 91; a10++)
				{
					if (!gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])])
					{
						gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = true;
						gpulist2[10] = 255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]]);
						if (!gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])])
						{
							gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = true;
							gpulist2[11] = 255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]]);
							if (!gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])])
							{
								gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = true;
								gpulist2[12] = 255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]]);
								if (!gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])])
								{
									gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = true;
									for (i = 0; i < permcount; i++)
									{
										if (gpulistlookup2[gpuperm1[i]] && gpulistlookup2[gpuperm2[i]] && gpulistlookup2[gpuperm3[i]])
										{
											gpupermcost[gpupermlist[i]] = 11;
										}
									}
									gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = false;
								}
								gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = false;
							}
							gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = false;
						}
						gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = false;
					}
				}
			}
		}
	}
}

__global__ void gates12(int* gpupermlist, int* gpuperm1, int* gpuperm2, int* gpuperm3, int* gpupermcost, int permcount, int* gpurline, int* gpulline)
{
	int i;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 45 * 36 * 28 * 21 * 15 * 10 * 6) return;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;

	int a7;
	int a8;
	int a9;
	int a10;
	int a11;

	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;

	int gpulist2[14] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;
	gpulist2[9] = 255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;

	for (a7 = a6 + 1; a7 < 55; a7++)
	{
		for (a8 = a7 + 1; a8 < 66; a8++)
		{
			for (a9 = a8 + 1; a9 < 78; a9++)
			{
				for (a10 = a9 + 1; a10 < 91; a10++)
				{
					for (a11 = a10 + 1; a11 < 105; a11++)
					{
						if (!gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])])
						{
							gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = true;
							gpulist2[10] = 255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]]);
							if (!gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])])
							{
								gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = true;
								gpulist2[11] = 255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]]);
								if (!gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])])
								{
									gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = true;
									gpulist2[12] = 255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]]);
									if (!gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])])
									{
										gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = true;
										gpulist2[13] = 255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]]);
										if (!gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])])
										{
											gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])] = true;

											for (i = 0; i < permcount; i++)
											{
												if (gpulistlookup2[gpuperm1[i]] && gpulistlookup2[gpuperm2[i]] && gpulistlookup2[gpuperm3[i]])
												{
													gpupermcost[gpupermlist[i]] = 12;
												}
											}
											gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])] = false;
										}
										gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = false;
									}
									gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = false;
								}
								gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = false;
							}
							gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = false;
						}
					}
				}
			}
		}
	}
}

__global__ void gates13(int* gpupermlist, int* gpuperm1, int* gpuperm2, int* gpuperm3, int* gpupermcost, int permcount, int* gpurline, int* gpulline)
{
	int i;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 45 * 36 * 28 * 21 * 15 * 10 * 6) return;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;

	int a7;
	int a8;
	int a9;
	int a10;
	int a11;
	int a12;

	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;

	int gpulist2[15] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;
	gpulist2[9] = 255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;

	for (a7 = a6 + 1; a7 < 55; a7++)
	{
		for (a8 = a7 + 1; a8 < 66; a8++)
		{
			for (a9 = a8 + 1; a9 < 78; a9++)
			{
				for (a10 = a9 + 1; a10 < 91; a10++)
				{
					for (a11 = a10 + 1; a11 < 105; a11++)
					{
						for (a12 = a11 + 1; a12 < 120; a12++)
						{
							if (!gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])])
							{
								gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = true;
								gpulist2[10] = 255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]]);
								if (!gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])])
								{
									gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = true;
									gpulist2[11] = 255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]]);
									if (!gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])])
									{
										gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = true;
										gpulist2[12] = 255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]]);
										if (!gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])])
										{
											gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = true;
											gpulist2[13] = 255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]]);
											if (!gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])])
											{
												gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])] = true;
												gpulist2[14] = 255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]]);
												if (!gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])])
												{
													gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])] = true;
													for (i = 0; i < permcount; i++)
													{
														if (gpulistlookup2[gpuperm1[i]] && gpulistlookup2[gpuperm2[i]] && gpulistlookup2[gpuperm3[i]])
														{
															gpupermcost[gpupermlist[i]] = 13;
														}
													}
													gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])] = false;
												}
												gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])] = false;
											}
											gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = false;
										}
										gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = false;
									}
									gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = false;
								}
								gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = false;
							}
						}
					}
				}
			}
		}
	}
}

__global__ void gates14(int* gpurline, int* gpulline, int ert)
{
	int i;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	int nbo = nb;

	if (nb >= 45 * 36 * 28 * 21 * 15 * 10 * 6) return;
	

	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;
	
	
	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;

	int a7;
	int a8;
	int a9;
	int a10;
	int a11;
	int a12;
	int a13;

	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;

	int gpulist2[16] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;
	gpulist2[9] = 255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;
	
	a7 = ert;
	if (a7 <  a6+1) return;
	//for (a7 = a6 + 1; a7 < 55; a7++)
	//{
		for (a8 = a7 + 1; a8 < 66; a8++)
		{
			for (a9 = a8 + 1; a9 < 78; a9++)
			{
				for (a10 = a9 + 1; a10 < 91; a10++)
				{
					for (a11 = a10 + 1; a11 < 105; a11++)
					{
						for (a12 = a11 + 1; a12 < 120; a12++)
						{
							for (a13 = a12 + 1; a13 < 136; a13++)
							{
								if (!gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])])
								{
									gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = true;
									gpulist2[10] = 255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]]);
									if (!gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])])
									{
										gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = true;
										gpulist2[11] = 255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]]);
										if (!gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])])
										{
											gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = true;
											gpulist2[12] = 255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]]);
											if (!gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])])
											{
												gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = true;
												gpulist2[13] = 255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]]);
												if (!gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])])
												{
													gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])] = true;
													gpulist2[14] = 255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]]);
													if (!gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])])
													{
														gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])] = true;
														gpulist2[15] = 255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]]);
														if (!gpulistlookup2[255 - (gpulist2[gpulline[a13]] | gpulist2[gpurline[a13]])])
														{
															gpulistlookup2[255 - (gpulist2[gpulline[a13]] | gpulist2[gpurline[a13]])] = true;
															
																if (gpulistlookup2[166] && gpulistlookup2[108] && gpulistlookup2[30])
																{
																	//gpupermcost[gpupermlist[i]] = 13;
																	printf("--%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d--        ", a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13);
																}
															
															gpulistlookup2[255 - (gpulist2[gpulline[a13]] | gpulist2[gpurline[a13]])] = false;
														}
														gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])] = false;
													}
													gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])] = false;
												}
												gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = false;
											}
											gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = false;
										}
										gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = false;
									}
									gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = false;
								}
							}
						}
					}
				}
			}
		}
	//}
}

__global__ void gates15(int* gpurline, int* gpulline, int ert,int ert2)
{
	int i;
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	int nbo = nb;

	if (nb >= 45 * 36 * 28 * 21 * 15 * 10 * 6) return;


	int a6 = nb % 45;
	nb -= a6;
	nb /= 45;
	int a5 = nb % 36;
	nb -= a5;
	nb /= 36;
	int a4 = nb % 28;
	nb -= a4;
	nb /= 28;


	int a3 = nb % 21;
	nb -= a3;
	nb /= 21;
	int a2 = nb % 15;
	nb -= a2;
	nb /= 15;
	int a1 = nb % 10;
	nb -= a1;
	nb /= 10;
	int a0 = nb;

	int a7;
	int a8;
	int a9;
	int a10;
	int a11;
	int a12;
	int a13;
	int a14;

	if (a1 <= a0) return;
	if (a2 <= a1) return;
	if (a3 <= a2) return;
	if (a4 <= a3) return;
	if (a5 <= a4) return;
	if (a6 <= a5) return;

	int gpulist2[16] = { 0 };
	bool gpulistlookup2[256] = { 0 };

	gpulist2[0] = 170;
	gpulist2[1] = 204;
	gpulist2[2] = 240;
	gpulistlookup2[170] = true;
	gpulistlookup2[204] = true;
	gpulistlookup2[240] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])]) return;

	gpulist2[3] = 255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a0]] | gpulist2[gpurline[a0]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])]) return;

	gpulist2[4] = 255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a1]] | gpulist2[gpurline[a1]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])]) return;

	gpulist2[5] = 255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a2]] | gpulist2[gpurline[a2]])] = true;


	if (gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])]) return;

	gpulist2[6] = 255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a3]] | gpulist2[gpurline[a3]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])]) return;

	gpulist2[7] = 255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a4]] | gpulist2[gpurline[a4]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])]) return;

	gpulist2[8] = 255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a5]] | gpulist2[gpurline[a5]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])]) return;
	gpulist2[9] = 255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a6]] | gpulist2[gpurline[a6]])] = true;

	a7 = ert;
	a8 = ert2;
	if (a7 < a6 + 1) return;
	//for (a7 = a6 + 1; a7 < 55; a7++)
	//{
	if (a8 < a7 + 1) return;
	//for (a8 = a7 + 1; a8 < 66; a8++)
	//{

	if (gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])]) return;
	gpulist2[10] = 255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a7]] | gpulist2[gpurline[a7]])] = true;

	if (gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])]) return;
	gpulist2[11] = 255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]]);
	gpulistlookup2[255 - (gpulist2[gpulline[a8]] | gpulist2[gpurline[a8]])] = true;

		for (a9 = a8 + 1; a9 < 78; a9++)
		{
			for (a10 = a9 + 1; a10 < 91; a10++)
			{
				for (a11 = a10 + 1; a11 < 105; a11++)
				{
					for (a12 = a11 + 1; a12 < 120; a12++)
					{
						for (a13 = a12 + 1; a13 < 136; a13++)
						{
							for (a14 = a13 + 1; a14 < 153; a14++)
							{
								
										if (!gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])])
										{
											gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = true;
											gpulist2[12] = 255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]]);
											if (!gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])])
											{
												gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = true;
												gpulist2[13] = 255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]]);
												if (!gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])])
												{
													gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])] = true;
													gpulist2[14] = 255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]]);
													if (!gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])])
													{
														gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])] = true;
														gpulist2[15] = 255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]]);
														if (!gpulistlookup2[255 - (gpulist2[gpulline[a13]] | gpulist2[gpurline[a13]])])
														{
															gpulistlookup2[255 - (gpulist2[gpulline[a13]] | gpulist2[gpurline[a13]])] = true;
															gpulist2[16] = 255 - (gpulist2[gpulline[a13]] | gpulist2[gpurline[a13]]);
															if (!gpulistlookup2[255 - (gpulist2[gpulline[a14]] | gpulist2[gpurline[a14]])])
															{
																gpulistlookup2[255 - (gpulist2[gpulline[a14]] | gpulist2[gpurline[a14]])] = true;

																if (gpulistlookup2[166] && gpulistlookup2[108] && gpulistlookup2[30])
																{
																	//gpupermcost[gpupermlist[i]] = 13;
																	printf("--%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d--        ", a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
																}

																gpulistlookup2[255 - (gpulist2[gpulline[a14]] | gpulist2[gpurline[a14]])] = false;
															}
															gpulistlookup2[255 - (gpulist2[gpulline[a13]] | gpulist2[gpurline[a13]])] = false;
														}
														gpulistlookup2[255 - (gpulist2[gpulline[a12]] | gpulist2[gpurline[a12]])] = false;
													}
													gpulistlookup2[255 - (gpulist2[gpulline[a11]] | gpulist2[gpurline[a11]])] = false;
												}
												gpulistlookup2[255 - (gpulist2[gpulline[a10]] | gpulist2[gpurline[a10]])] = false;
											}
											gpulistlookup2[255 - (gpulist2[gpulline[a9]] | gpulist2[gpurline[a9]])] = false;
										}
										
							}
						}
					}
				}
			}
		}
	//}
	//}
}



int main()
{
	cudaSetDevice(0);

	cudaMalloc((void**)&gpupermlist, 40320 * sizeof(int));
	cudaMalloc((void**)&gpuperm1, 40320 * sizeof(int));
	cudaMalloc((void**)&gpuperm2, 40320 * sizeof(int));
	cudaMalloc((void**)&gpuperm3, 40320 * sizeof(int));
	cudaMalloc((void**)&gpupermcost, 40320 * sizeof(int));

	cudaMalloc((void**)&gpulistlookup, 256 * sizeof(bool));
	cudaMalloc((void**)&gpulist, 17 * sizeof(int));
	cudaMalloc((void**)&gpulline, 153 * sizeof(int));
	cudaMalloc((void**)&gpurline, 153 * sizeof(int));

	int a0, a1, a2, a3, a4, a5, l, k;


	int* permstats = new int[17 * 17];
	int n1, n2, count1, count2;

	int i, j, tmp;

	std::clock_t c_start;

	int* lline = new int[153]; //(7,0), (7,1), ...
	int* rline = new int[153]; 

	int* stats = new int[17];
	int* list = new int[17];


	int* permtmp = new int[8];

	int permcount = 40320;

	bool* listlookup = new bool[256];

	int tmp1, tmp2, tmp3, pow;

	for (i = 0; i < 17; i++) stats[i] = 0;
	for (i = 0; i < 153; i++) lline[i] = 0;
	for (i = 0; i < 153; i++) rline[i] = 0;
	for (i = 0; i < 17; i++) list[i] = 0;
	for (i = 0; i < 256; i++) listlookup[i] = false;
	for (i = 0; i < 17 * 17; i++) permstats[i] = 0;
	for (i = 0; i < 8; i++) permtmp[i] = 0;
	

	for (i = 0; i < 40320; i++)
	{
		permlist[i] = 0;
		perm1[i] = 0;
		perm2[i] = 0;
		perm3[i] = 0;
		permcost[i] = 0;
		permcheck[i] = false;
	}

	for (i = 0; i < 40320; i++)
	{
		permlist[i] = i;
		permcost[i] = -1;
		perm(i, permtmp);

		pow = 1;
		tmp1 = 0;
		tmp2 = 0;
		tmp3 = 0;
		for (j = 0; j < 8; j++)
		{
			tmp1 += pow * (permtmp[j] % 2);
			permtmp[j] -= permtmp[j] % 2;
			permtmp[j] /= 2;

			tmp2 += pow * (permtmp[j] % 2);
			permtmp[j] -= permtmp[j] % 2;
			permtmp[j] /= 2;

			tmp3 += pow * (permtmp[j] % 2);

			pow *= 2;
		}

		perm1[i] = tmp1;
		perm2[i] = tmp2;
		perm3[i] = tmp3;
	}


	tmp = 0;
	for (i = 0; i < 17; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}


	for (i = 0; i < permcount; i++)
	{
		for (j = 0; j < 6; j++)
		{
			for (k = 0; k < 6; k++)
			{
				tmp = conj(permlist[i], j, k);
				for (l = i + 1; l < permcount; l++)
				{
					if (permlist[l] == tmp)
					{
						permcount--;
						perm1[l] = perm1[permcount];
						perm2[l] = perm2[permcount];
						perm3[l] = perm3[permcount];
						permlist[l] = permlist[permcount];
						l = 50000;
					}
				}
			}
		}
	}

	//0 gates//
	list[0] = 170;
	list[1] = 204;
	list[2] = 240;
	listlookup[170] = true;
	listlookup[204] = true;
	listlookup[240] = true;

	for (i = 0; i < permcount; i++)
	{
		while (listlookup[perm1[i]] && listlookup[perm2[i]] && listlookup[perm3[i]] && permcount > i)
		{
			stats[0]++;
			permcost[permlist[i]] = 0;
			permcount--;
			perm1[i] = perm1[permcount];
			perm2[i] = perm2[permcount];
			perm3[i] = perm3[permcount];
			permlist[i] = permlist[permcount];

		}
	}
	printf("0:%d\n", stats[0]);


	//1 gate//
	for (a0 = 0; a0 < 6; a0++)
	{
		if (!listlookup[255 - (list[lline[a0]] | list[rline[a0]])]) {
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (i = 0; i < permcount; i++)
			{
				while (listlookup[perm1[i]] && listlookup[perm2[i]] && listlookup[perm3[i]] && permcount > i)
				{
					stats[1]++;
					permcost[permlist[i]] = 1;
					permcount--;
					perm1[i] = perm1[permcount];
					perm2[i] = perm2[permcount];
					perm3[i] = perm3[permcount];
					permlist[i] = permlist[permcount];
				}
			}
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("1:%d\n", stats[1]);

	//2 gates//
	for (a0 = 0; a0 < 6; a0++)
	{
		if (!listlookup[255 - (list[lline[a0]] | list[rline[a0]])]) {
			list[3] = 255 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = true;

			for (a1 = a0 + 1; a1 < 10; a1++)
			{
				if (!listlookup[255 - (list[lline[a1]] | list[rline[a1]])]) {
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (i = 0; i < permcount; i++)
					{
						while (listlookup[perm1[i]] && listlookup[perm2[i]] && listlookup[perm3[i]] && permcount > i)
						{
							stats[2]++;
							permcost[permlist[i]] = 2;
							permcount--;
							perm1[i] = perm1[permcount];
							perm2[i] = perm2[permcount];
							perm3[i] = perm3[permcount];
							permlist[i] = permlist[permcount];
						}
					}
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = false;
				}

			}
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = false;
		}

	}
	printf("2:%d\n", stats[2]);


	//3 gates//
	for (a0 = 0; a0 < 6; a0++)
	{
		if (!listlookup[255 - (list[lline[a0]] | list[rline[a0]])]) {
			list[3] = 255 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 10; a1++)
			{
				if (!listlookup[255 - (list[lline[a1]] | list[rline[a1]])]) {
					list[4] = 255 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 15; a2++)
					{
						if (!listlookup[255 - (list[lline[a2]] | list[rline[a2]])]) {
							listlookup[255 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (i = 0; i < permcount; i++)
							{
								while (listlookup[perm1[i]] && listlookup[perm2[i]] && listlookup[perm3[i]] && permcount > i)
								{
									stats[3]++;
									permcost[permlist[i]] = 3;
									permcount--;
									perm1[i] = perm1[permcount];
									perm2[i] = perm2[permcount];
									perm3[i] = perm3[permcount];
									permlist[i] = permlist[permcount];

								}
							}
							listlookup[255 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("3:%d\n", stats[3]);

	//4 gates//
	for (a0 = 0; a0 < 6; a0++)
	{
		if (!listlookup[255 - (list[lline[a0]] | list[rline[a0]])]) {
			list[3] = 255 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 10; a1++)
			{
				if (!listlookup[255 - (list[lline[a1]] | list[rline[a1]])]) {
					list[4] = 255 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = true;

					for (a2 = a1 + 1; a2 < 15; a2++)
					{
						if (!listlookup[255 - (list[lline[a2]] | list[rline[a2]])]) {
							list[5] = 255 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[255 - (list[lline[a2]] | list[rline[a2]])] = true;

							for (a3 = a2 + 1; a3 < 21; a3++)
							{
								if (!listlookup[255 - (list[lline[a3]] | list[rline[a3]])]) {
									listlookup[255 - (list[lline[a3]] | list[rline[a3]])] = true;
									for (i = 0; i < permcount; i++)
									{
										while (listlookup[perm1[i]] && listlookup[perm2[i]] && listlookup[perm3[i]] && permcount > i)
										{
											stats[4]++;
											permcost[permlist[i]] = 4;
											permcount--;
											perm1[i] = perm1[permcount];
											perm2[i] = perm2[permcount];
											perm3[i] = perm3[permcount];
											permlist[i] = permlist[permcount];

										}
									}
									listlookup[255 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[255 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("4:%d\n", stats[4]);

	//5 gates//
	for (a0 = 0; a0 < 6; a0++)
	{
		if (!listlookup[255 - (list[lline[a0]] | list[rline[a0]])]) {
			list[3] = 255 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 10; a1++)
			{
				if (!listlookup[255 - (list[lline[a1]] | list[rline[a1]])]) {
					list[4] = 255 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 15; a2++)
					{
						if (!listlookup[255 - (list[lline[a2]] | list[rline[a2]])]) {
							list[5] = 255 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[255 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 21; a3++)
							{
								if (!listlookup[255 - (list[lline[a3]] | list[rline[a3]])]) {
									list[6] = 255 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[255 - (list[lline[a3]] | list[rline[a3]])] = true;
									for (a4 = a3 + 1; a4 < 28; a4++)
									{
										if (!listlookup[255 - (list[lline[a4]] | list[rline[a4]])]) {
											listlookup[255 - (list[lline[a4]] | list[rline[a4]])] = true;
											for (i = 0; i < permcount; i++)
											{
												while (listlookup[perm1[i]] && listlookup[perm2[i]] && listlookup[perm3[i]] && permcount > i)
												{
													stats[5]++;
													permcost[permlist[i]] = 5;
													permcount--;
													perm1[i] = perm1[permcount];
													perm2[i] = perm2[permcount];
													perm3[i] = perm3[permcount];
													permlist[i] = permlist[permcount];
												}
											}
											listlookup[255 - (list[lline[a4]] | list[rline[a4]])] = false;
										}
									}
									listlookup[255 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[255 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("5:%d\n", stats[5]);

	//6 gates//
	for (a0 = 0; a0 < 6; a0++)
	{
		if (!listlookup[255 - (list[lline[a0]] | list[rline[a0]])]) {
			list[3] = 255 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 10; a1++)
			{
				if (!listlookup[255 - (list[lline[a1]] | list[rline[a1]])]) {
					list[4] = 255 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 15; a2++)
					{
						if (!listlookup[255 - (list[lline[a2]] | list[rline[a2]])]) {
							list[5] = 255 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[255 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 21; a3++)
							{
								if (!listlookup[255 - (list[lline[a3]] | list[rline[a3]])]) {
									list[6] = 255 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[255 - (list[lline[a3]] | list[rline[a3]])] = true;
									for (a4 = a3 + 1; a4 < 28; a4++)
									{
										if (!listlookup[255 - (list[lline[a4]] | list[rline[a4]])]) {
											list[7] = 255 - (list[lline[a4]] | list[rline[a4]]);
											listlookup[255 - (list[lline[a4]] | list[rline[a4]])] = true;
											for (a5 = a4 + 1; a5 < 36; a5++)
											{
												if (!listlookup[255 - (list[lline[a5]] | list[rline[a5]])]) {
													listlookup[255 - (list[lline[a5]] | list[rline[a5]])] = true;
													for (i = 0; i < permcount; i++)
													{
														while (listlookup[perm1[i]] && listlookup[perm2[i]] && listlookup[perm3[i]] && permcount > i)
														{
															stats[6]++;
															permcost[permlist[i]] = 6;
															permcount--;
															perm1[i] = perm1[permcount];
															perm2[i] = perm2[permcount];
															perm3[i] = perm3[permcount];
															permlist[i] = permlist[permcount];
														}
													}
													listlookup[255 - (list[lline[a5]] | list[rline[a5]])] = false;
												}
											}
											listlookup[255 - (list[lline[a4]] | list[rline[a4]])] = false;
										}
									}
									listlookup[255 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[255 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[255 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[255 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("6:%d\n", stats[6]);

	
	// 7 gates CUDA //
	cudaMemcpy(gpulline, lline, 120 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpurline, rline, 120 * sizeof(int), cudaMemcpyHostToDevice);

	cudaMemcpy(gpupermlist, permlist, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm1, perm1, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm2, perm2, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm3, perm3, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpupermcost, permcost, 40320 * sizeof(int), cudaMemcpyHostToDevice);


	c_start = std::clock();
	count1 = permcount;


	gates7 << <(45 * 36 * 28 * 21 * 15 * 10 * 6) / 128 + 1, 128 >> > (gpupermlist, gpuperm1, gpuperm2, gpuperm3, gpupermcost, permcount, gpurline, gpulline);
	cudaDeviceSynchronize();



	cudaMemcpy(permcost, gpupermcost, 40320 * sizeof(int), cudaMemcpyDeviceToHost);

	for (i = 0; i < permcount; i++)
	{
		while (permcost[permlist[i]] == 7 && permcount > i)
		{
			permcount--;
			perm1[i] = perm1[permcount];
			perm2[i] = perm2[permcount];
			perm3[i] = perm3[permcount];
			permlist[i] = permlist[permcount];
		}
	}
	cudaMemcpy(gpupermlist, permlist, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm1, perm1, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm2, perm2, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm3, perm3, 40320 * sizeof(int), cudaMemcpyHostToDevice);

	count2 = permcount;
	printf("7:%d time:%f\n", count1 - count2, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);


	// 8 gates CUDA //
	c_start = std::clock();
	count1 = permcount;


	gates8 << <(45 * 36 * 28 * 21 * 15 * 10 * 6) / 128 + 1, 128 >> > (gpupermlist, gpuperm1, gpuperm2, gpuperm3, gpupermcost, permcount, gpurline, gpulline);
	cudaDeviceSynchronize();



	cudaMemcpy(permcost, gpupermcost, 40320 * sizeof(int), cudaMemcpyDeviceToHost);

	for (i = 0; i < permcount; i++)
	{
		while (permcost[permlist[i]] == 8 && permcount > i)
		{
			permcount--;
			perm1[i] = perm1[permcount];
			perm2[i] = perm2[permcount];
			perm3[i] = perm3[permcount];
			permlist[i] = permlist[permcount];
		}
	}
	cudaMemcpy(gpupermlist, permlist, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm1, perm1, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm2, perm2, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm3, perm3, 40320 * sizeof(int), cudaMemcpyHostToDevice);

	count2 = permcount;
	printf("8:%d time:%f\n", count1 - count2, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);


	// 9 gates CUDA //
	c_start = std::clock();
	count1 = permcount;

	gates9 << <(45 * 36 * 28 * 21 * 15 * 10 * 6) / 256 + 1, 256 >> > (gpupermlist, gpuperm1, gpuperm2, gpuperm3, gpupermcost, permcount, gpurline, gpulline);
	cudaDeviceSynchronize();


	cudaMemcpy(permcost, gpupermcost, 40320 * sizeof(int), cudaMemcpyDeviceToHost);

	for (i = 0; i < permcount; i++)
	{
		while (permcost[permlist[i]] == 9 && permcount > i)
		{
			permcount--;
			perm1[i] = perm1[permcount];
			perm2[i] = perm2[permcount];
			perm3[i] = perm3[permcount];
			permlist[i] = permlist[permcount];
		}
	}
	cudaMemcpy(gpupermlist, permlist, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm1, perm1, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm2, perm2, 40320 * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(gpuperm3, perm3, 40320 * sizeof(int), cudaMemcpyHostToDevice);


	count2 = permcount;
	printf("9:%d time:%f\n", count1 - count2, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

	
	// 10 gates CUDA //
c_start = std::clock();
count1 = permcount;

			gates10 << <(45 * 36 * 28 * 21 * 15 * 10 * 6) / 128 + 1, 128 >> > (gpupermlist, gpuperm1, gpuperm2, gpuperm3, gpupermcost, permcount, gpurline, gpulline);
			cudaDeviceSynchronize();


			cudaMemcpy(permcost, gpupermcost, 40320 * sizeof(int), cudaMemcpyDeviceToHost);

			for (i = 0; i < permcount; i++)
			{
				while (permcost[permlist[i]] == 10 && permcount > i)
				{
					permcount--;
					perm1[i] = perm1[permcount];
					perm2[i] = perm2[permcount];
					perm3[i] = perm3[permcount];
					permlist[i] = permlist[permcount];
				}
			}
			cudaMemcpy(gpupermlist, permlist, 40320 * sizeof(int), cudaMemcpyHostToDevice);
			cudaMemcpy(gpuperm1, perm1, 40320 * sizeof(int), cudaMemcpyHostToDevice);
			cudaMemcpy(gpuperm2, perm2, 40320 * sizeof(int), cudaMemcpyHostToDevice);
			cudaMemcpy(gpuperm3, perm3, 40320 * sizeof(int), cudaMemcpyHostToDevice);


count2 = permcount;
printf("10:%d time:%f\n", count1 - count2, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);


// 11 gates CUDA //
c_start = std::clock();
count1 = permcount;

gates11 << <(45 * 36 * 28 * 21 * 15 * 10 * 6) / 128 + 1, 128 >> > (gpupermlist, gpuperm1, gpuperm2, gpuperm3, gpupermcost, permcount, gpurline, gpulline);
cudaDeviceSynchronize();


cudaMemcpy(permcost, gpupermcost, 40320 * sizeof(int), cudaMemcpyDeviceToHost);

for (i = 0; i < permcount; i++)
{
	while (permcost[permlist[i]] == 11 && permcount>i)
	{
		permcount--;
		perm1[i] = perm1[permcount];
		perm2[i] = perm2[permcount];
		perm3[i] = perm3[permcount];
		permlist[i] = permlist[permcount];
	}
}
cudaMemcpy(gpupermlist, permlist, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm1, perm1, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm2, perm2, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm3, perm3, 40320 * sizeof(int), cudaMemcpyHostToDevice);


count2 = permcount;
printf("11:%d time:%f\n", count1 - count2, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

// 12 gates CUDA //
c_start = std::clock();
count1 = permcount;

gates12 << <(45 * 36 * 28 * 21 * 15 * 10 * 6) / 128 + 1, 128 >> > (gpupermlist, gpuperm1, gpuperm2, gpuperm3, gpupermcost, permcount, gpurline, gpulline);
cudaDeviceSynchronize();


cudaMemcpy(permcost, gpupermcost, 40320 * sizeof(int), cudaMemcpyDeviceToHost);

for (i = 0; i < permcount; i++)
{
	while (permcost[permlist[i]] == 12 && permcount > i)
	{
		permcount--;
		perm1[i] = perm1[permcount];
		perm2[i] = perm2[permcount];
		perm3[i] = perm3[permcount];
		permlist[i] = permlist[permcount];
	}
}
cudaMemcpy(gpupermlist, permlist, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm1, perm1, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm2, perm2, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm3, perm3, 40320 * sizeof(int), cudaMemcpyHostToDevice);


count2 = permcount;
printf("12:%d time:%f\n", count1 - count2, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);


// 13 gates CUDA //
c_start = std::clock();
count1 = permcount;

gates13 << <(45 * 36 * 28 * 21 * 15 * 10 * 6) / 128 + 1, 128 >> > (gpupermlist, gpuperm1, gpuperm2, gpuperm3, gpupermcost, permcount, gpurline, gpulline);
cudaDeviceSynchronize();


cudaMemcpy(permcost, gpupermcost, 40320 * sizeof(int), cudaMemcpyDeviceToHost);

for (i = 0; i < permcount; i++)
{
	while (permcost[permlist[i]] == 13 && permcount > i)
	{
		permcount--;
		perm1[i] = perm1[permcount];
		perm2[i] = perm2[permcount];
		perm3[i] = perm3[permcount];
		permlist[i] = permlist[permcount];
	}
}
cudaMemcpy(gpupermlist, permlist, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm1, perm1, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm2, perm2, 40320 * sizeof(int), cudaMemcpyHostToDevice);
cudaMemcpy(gpuperm3, perm3, 40320 * sizeof(int), cudaMemcpyHostToDevice);


count2 = permcount;
printf("13:%d time:%f\n", count1 - count2, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);


//31711,211,19076,38399,32584,36083,624,621,39414,616,38161,37799,102,339,74,376,561,47,39095,19,40,30855
	
/*
	c_start = std::clock();
	count1 = permcount;

	int tmprr,tmprr2;
	for (tmprr = 54; tmprr > 0; tmprr--)
	{
		for (tmprr2 = 65; tmprr2 > 0; tmprr2--)
		{
			gates15 << <(45 * 36 * 28 * 21 * 15 * 10 * 6) / 256 + 1, 256 >> > (gpurline, gpulline, tmprr,tmprr2);
			cudaDeviceSynchronize();
			printf("  **%d,%d**  ", tmprr,tmprr2);
		}
	}

	printf("END");
	return 0;
	/////end/////tmp code for 14 gates////
	*/


permcost[40] = 15;

for (i = 0; i < 40320; i++)
{
	if (permcost[i] != -1)
	{
		for (j = 0; j < 6; j++)
		{
			for (k = 0; k < 6; k++)
			{
				permcost[conj(i, j, k)] = permcost[i];
			}
		}
	}
}
	for (i = 0; i < 17; i++) stats[i] = 0;

	

	for (i = 0; i < 40320; i++) stats[permcost[i]]++;

	for (i = 0; i < 16; i++) printf("%d:%d\n", i, stats[i]);

	//final output//

	for (i = 0; i < 40320; i++)
	{
		n1 = permcost[i];
		n2 = permcost[perminv(i)];

		permstats[16 * n1 + n2]++;
		//if (n1 - n2 >= 3) printf("*** %d,%d,%d,%d *** \n", i, perminv(i), n1 - n2,n1);
		//if (n2 - n1 >= 3) printf("** %d,%d,%d,%d ** \n", i, perminv(i), n2 - n1, n2);
	}

	for (i = 0; i < 16 * 16; i++)
	{
		printf("%d:%d\n", i, permstats[i]);
	}

	return 0;
}

void perm(int k, int* permuted)
{
	int i, ind, m = k;

	int* elems = new int[8];
	for (i = 0; i < 8; i++) elems[i] = i;
	for (i = 0; i < 8; i++)
	{
		ind = m % (8 - i);
		m = m / (8 - i);
		permuted[i] = elems[ind];
		elems[ind] = elems[7 - i];
	}
}

int inv(int* perm)
{
	int i, k = 0, m = 1;
	int* pos = new int[8];
	int* elems = new int[8];
	for (i = 0; i < 8; i++) { pos[i] = i; elems[i] = i; }
	for (i = 0; i < 7; i++)
	{
		k += m * pos[perm[i]];
		m = m * (8 - i);
		pos[elems[7 - i]] = pos[perm[i]];
		elems[pos[perm[i]]] = elems[7 - i];
	}
	return k;
}

int perminv(int k)
{
	int* permtmp = new int[8];
	int* permnew = new int[8];
	perm(k, permtmp);

	for (int i = 0; i < 8; i++) permnew[permtmp[i]] = i;

	return inv(permnew);
}

int conj(int k, int a, int b)
{
	int* permtmp = new int[8];
	int i, j, tmp;
	int table[8][3] = { 0 };
	int table2[8][3] = { 0 };
	int table3[8][3] = { 0 };
	int* newperm = new int[8];
	perm(k, permtmp);

	for (i = 0; i < 8; i++)
	{
		tmp = permtmp[i] % 2;
		table[i][0] = tmp;
		permtmp[i] -= tmp;
		permtmp[i] /= 2;
		tmp = permtmp[i] % 2;
		table[i][1] = tmp;
		permtmp[i] -= tmp;
		permtmp[i] /= 2;
		tmp = permtmp[i] % 2;
		table[i][2] = tmp;
	}

	for (i = 0; i < 3; i++)
	{
		table2[0][i] = table[0][i];
		table2[7][i] = table[7][i];
	}

	if (a == 0)
	{
		for (i = 0; i < 3; i++)
		{
			table2[1][i] = table[1][i];
			table2[2][i] = table[2][i];
			table2[3][i] = table[3][i];
			table2[4][i] = table[4][i];
			table2[5][i] = table[5][i];
			table2[6][i] = table[6][i];
		}
	}
	else if (a == 1)
	{
		for (i = 0; i < 3; i++)
		{
			table2[1][i] = table[2][i];
			table2[2][i] = table[4][i];
			table2[3][i] = table[6][i];
			table2[4][i] = table[1][i];
			table2[5][i] = table[3][i];
			table2[6][i] = table[5][i];
		}
	}
	else if (a == 2)
	{
		for (i = 0; i < 3; i++)
		{
			table2[1][i] = table[4][i];
			table2[2][i] = table[1][i];
			table2[3][i] = table[5][i];
			table2[4][i] = table[2][i];
			table2[5][i] = table[6][i];
			table2[6][i] = table[3][i];
		}
	}
	else if (a == 3)
	{
		for (i = 0; i < 3; i++)
		{
			table2[1][i] = table[2][i];
			table2[2][i] = table[1][i];
			table2[3][i] = table[3][i];
			table2[4][i] = table[4][i];
			table2[5][i] = table[6][i];
			table2[6][i] = table[5][i];
		}
	}
	else if (a == 4)
	{
		for (i = 0; i < 3; i++)
		{
			table2[1][i] = table[4][i];
			table2[2][i] = table[2][i];
			table2[3][i] = table[6][i];
			table2[4][i] = table[1][i];
			table2[5][i] = table[5][i];
			table2[6][i] = table[3][i];
		}
	}
	else
	{
		for (i = 0; i < 3; i++)
		{
			table2[1][i] = table[1][i];
			table2[2][i] = table[4][i];
			table2[3][i] = table[5][i];
			table2[4][i] = table[2][i];
			table2[5][i] = table[3][i];
			table2[6][i] = table[6][i];
		}
	}


	if (b == 0)
	{
		for (i = 0; i < 8; i++)
		{
			for (j = 0; j < 3; j++)
			{
				table3[i][j] = table2[i][j];
			}
		}
	}
	else if (b == 1)
	{
		for (i = 0; i < 8; i++)
		{
			table3[i][0] = table2[i][0];
			table3[i][1] = table2[i][2];
			table3[i][2] = table2[i][1];
		}
	}
	else if (b == 2)
	{
		for (i = 0; i < 8; i++)
		{
			table3[i][0] = table2[i][1];
			table3[i][1] = table2[i][2];
			table3[i][2] = table2[i][0];
		}
	}
	else if (b == 3)
	{
		for (i = 0; i < 8; i++)
		{
			table3[i][0] = table2[i][1];
			table3[i][1] = table2[i][0];
			table3[i][2] = table2[i][2];
		}
	}
	else if (b == 4)
	{
		for (i = 0; i < 8; i++)
		{
			table3[i][0] = table2[i][2];
			table3[i][1] = table2[i][0];
			table3[i][2] = table2[i][1];
		}
	}
	else
	{
		for (i = 0; i < 8; i++)
		{
			table3[i][0] = table2[i][2];
			table3[i][1] = table2[i][1];
			table3[i][2] = table2[i][0];
		}
	}

	for (i = 0; i < 8; i++) {
		newperm[i] = table3[i][0] + 2 * table3[i][1] + 4 * table3[i][2];
	}

	return inv(newperm);
}

