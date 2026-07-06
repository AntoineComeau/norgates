
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <math.h>
#include <ctime>

#define _USE_MATH_DEFINES

static bool* gpufunc = 0;

__global__ void setfunc(bool* gpufunc)
{

	int i, tmpo;
	for (i = 0; i < 65536; i++)
	{

		tmpo = i + 1;
		if (
			//tmpo == 5737 
			//|| tmpo == 5738
			//|| tmpo == 5739
			//|| tmpo == 5740
			//|| tmpo == 5741
			//|| tmpo == 5742
			//|| tmpo == 5753
			//|| tmpo == 5754
			//|| tmpo == 5993
			tmpo == 5994
			//|| tmpo == 10648
			//|| tmpo == 18840
			//|| tmpo == 24984
			//|| tmpo == 26754
			//|| tmpo == 26904
			//|| tmpo == 27032
			//|| tmpo == 27581
			//|| tmpo == 28123
			//|| tmpo == 31207
			//|| tmpo == 32407
			//|| tmpo == 32490
			//|| tmpo == 33130
			//|| tmpo == 34330
			//|| tmpo == 34415
			//|| tmpo == 37414
			//|| tmpo == 37499
			//|| tmpo == 37956
			//|| tmpo == 38013
			//|| tmpo == 38511
			//|| tmpo == 38523
			//|| tmpo == 38525
			//|| tmpo == 38527
			//|| tmpo == 38528
			//|| tmpo == 38634
			//|| tmpo == 38699
			//|| tmpo == 38733
			//|| tmpo == 38763
			//|| tmpo == 38765
			//|| tmpo == 38767
			//|| tmpo == 38768
			//|| tmpo == 38769
			//|| tmpo == 38777
			//|| tmpo == 38779
			//|| tmpo == 38780
			//|| tmpo == 38781
			//|| tmpo == 38782
			//|| tmpo == 38783
			//|| tmpo == 38784
			//|| tmpo == 40554
			//|| tmpo == 46698
			//|| tmpo == 54890
			|| tmpo == 59799)
		{
			gpufunc[i] = false;
		}
		else gpufunc[i] = true;
	}
}

/*
__device__ void detectfunc(bool* gpufunc, uint16_t tmpo, uint8_t a0, uint8_t a1, uint8_t a2, uint8_t a3, uint8_t a4, uint8_t a5, uint8_t a6, uint8_t a7, uint8_t a8, uint8_t a9, uint8_t a10, uint8_t a11, uint8_t a12, uint8_t a13)
{

	if (gpufunc[tmpo])
	{
		printf("%d:%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n", tmpo, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
	}

	tmpo += 1;
	if (tmpo == 5737 || tmpo == 5738
		|| tmpo == 5739
		|| tmpo == 5740
		|| tmpo == 5741
		|| tmpo == 5742
		|| tmpo == 5753
		|| tmpo == 5754
		|| tmpo == 5993
		|| tmpo == 5994
		|| tmpo == 10648
		|| tmpo == 18840
		|| tmpo == 24984
		|| tmpo == 26754
		|| tmpo == 26904
		|| tmpo == 27032
		|| tmpo == 27581
		|| tmpo == 28123
		|| tmpo == 31207
		|| tmpo == 32407
		|| tmpo == 32490
		|| tmpo == 33130
		|| tmpo == 34330
		|| tmpo == 34415
		|| tmpo == 37414
		|| tmpo == 37499
		|| tmpo == 37956
		|| tmpo == 38013
		|| tmpo == 38511
		|| tmpo == 38523
		|| tmpo == 38525
		|| tmpo == 38527
		|| tmpo == 38528
		|| tmpo == 38634
		|| tmpo == 38699
		|| tmpo == 38733
		|| tmpo == 38763
		|| tmpo == 38765
		|| tmpo == 38767
		|| tmpo == 38768
		|| tmpo == 38769
		|| tmpo == 38777
		|| tmpo == 38779
		|| tmpo == 38780
		|| tmpo == 38781
		|| tmpo == 38782
		|| tmpo == 38783
		|| tmpo == 38784
		|| tmpo == 40554
		|| tmpo == 46698
		|| tmpo == 54890
		|| tmpo == 59799)
	{
		printf("%d:%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",tmpo,a0,a1,a2,a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
	}

}

__global__ void setfunc(bool* gpufunc)
{
	int tmpc,tmpo;

	for (tmpc = 0; tmpc < 65536; tmpc++)
	{
		tmpo = tmpc + 1;
		if (tmpo == 5737 || tmpo == 5738
			|| tmpo == 5739
			|| tmpo == 5740
			|| tmpo == 5741
			|| tmpo == 5742
			|| tmpo == 5753
			|| tmpo == 5754
			|| tmpo == 5993
			|| tmpo == 5994
			|| tmpo == 10648
			|| tmpo == 18840
			|| tmpo == 24984
			|| tmpo == 26754
			|| tmpo == 26904
			|| tmpo == 27032
			|| tmpo == 27581
			|| tmpo == 28123
			|| tmpo == 31207
			|| tmpo == 32407
			|| tmpo == 32490
			|| tmpo == 33130
			|| tmpo == 34330
			|| tmpo == 34415
			|| tmpo == 37414
			|| tmpo == 37499
			|| tmpo == 37956
			|| tmpo == 38013
			|| tmpo == 38511
			|| tmpo == 38523
			|| tmpo == 38525
			|| tmpo == 38527
			|| tmpo == 38528
			|| tmpo == 38634
			|| tmpo == 38699
			|| tmpo == 38733
			|| tmpo == 38763
			|| tmpo == 38765
			|| tmpo == 38767
			|| tmpo == 38768
			|| tmpo == 38769
			|| tmpo == 38777
			|| tmpo == 38779
			|| tmpo == 38780
			|| tmpo == 38781
			|| tmpo == 38782
			|| tmpo == 38783
			|| tmpo == 38784
			|| tmpo == 40554
			|| tmpo == 46698
			|| tmpo == 54890
			|| tmpo == 59799)
		{
			gpufunc[tmpc] = true;
		}
		else gpufunc[tmpc] = false;
	}
}



__global__ void gates10(bool* gpufunc)
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 12560) return;
	uint8_t a0, a1, a2, a3, a4, a5, a6, a7, a8, a9;

	uint8_t aa0, aa1, aa2, aa3;
	uint16_t acount = 0;

	for (aa0 = 0; aa0 < 10; aa0++)
	{
		for (aa1 = aa0 + 1; aa1 < 15; aa1++)
		{
			for (aa2 = aa1 + 1; aa2 < 21; aa2++)
			{
				for (aa3 = aa2 + 1; aa3 < 28; aa3++)
				{
					if (nb == acount)
					{
						a0 = aa0;
						a1 = aa1;
						a2 = aa2;
						a3 = aa3;
					}
					acount++;
				}
			}
		}
	}



		uint8_t i, j, tmp;

		uint8_t lline[136]; //(7,0), (7,1), ...
		uint8_t rline[136];

		uint16_t list[13];

		bool listlookup[65536];
		//bool func[65536];



		tmp = 0;
		for (i = 0; i < 13; i++)
		{
			for (j = 0; j <= i; j++)
			{
				lline[tmp] = i;
				rline[tmp] = j;
				tmp++;
			}
		}

		list[0] = 43690;
		list[1] = 52428;
		list[2] = 61680;
		list[3] = 65280;
		listlookup[43690] = true;
		listlookup[52428] = true;
		listlookup[61680] = true;
		listlookup[65280] = true;

		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;

			if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
				list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
				listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;

				if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
					list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
					listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;

					if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
						list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
						listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
						for (a4 = a3 + 1; a4 < 36; a4++)
						{
							if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
								list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
								for (a5 = a4 + 1; a5 < 45; a5++)
								{
									if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
										list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
										for (a6 = a5 + 1; a6 < 55; a6++)
										{

											if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
												list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
												for (a7 = a6 + 1; a7 < 66; a7++)
												{
													if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
														list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
														for (a8 = a7 + 1; a8 < 78; a8++)
														{
															if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
																list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
																for (a9 = 0; a9 < 13; a9++)
																{
																	//if (!func[65535 - (list[12] | list[a9])]) {
																		gpufunc[65535 - (list[12] | list[a9])] = true;
																		//func[65535 - (list[12] | list[a9])] = true;
																	//}
																	//if(65535 - (list[12] | list[a9]) == 26753)
																	//{
																	//	printf("rererere");
																	//}
																}
															}
														}
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
													}
												}
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
											}
										}
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
									}
								}
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
							}
						}
					}
				}
			}
		}

}

__global__ void gates11(bool* gpufunc)
{
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	int a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10;

	a0 = nb % 10;
	nb -= a0;
	nb /= 10;

	a1 = nb % 15;
	nb -= a1;
	nb /= 15;

	a2 = nb % 21;
	nb -= a2;
	nb /= 21;

	a3 = nb % 28;


	if (a1 > a0 && a2 > a1 && a3 > a2)
	{



		int i, j, tmp;

		int lline[153] = { 0 }; //(7,0), (7,1), ...
		int rline[153] = { 0 };

		int list[14] = { 0 };

		bool listlookup[65536] = { 0 };


		tmp = 0;
		for (i = 0; i < 14; i++)
		{
			for (j = 0; j <= i; j++)
			{
				lline[tmp] = i;
				rline[tmp] = j;
				tmp++;
			}
		}



		list[0] = 43690;
		list[1] = 52428;
		list[2] = 61680;
		list[3] = 65280;
		listlookup[43690] = true;
		listlookup[52428] = true;
		listlookup[61680] = true;
		listlookup[65280] = true;



		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;

			if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
				list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
				listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;

				if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
					list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
					listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;

					if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
						list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
						listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
						for (a4 = a3 + 1; a4 < 36; a4++)
						{
							if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
								list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
								for (a5 = a4 + 1; a5 < 45; a5++)
								{
									if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
										list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
										for (a6 = a5 + 1; a6 < 55; a6++)
										{
											if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
												list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
												for (a7 = a6 + 1; a7 < 66; a7++)
												{
													if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
														list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
														for (a8 = a7 + 1; a8 < 78; a8++)
														{
															if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
																list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
																listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
																for (a9 = a8 + 1; a9 < 91; a9++)
																{
																	if (!listlookup[65535 - (list[lline[a9]] | list[rline[a9]])]) {
																		list[13] = 65535 - (list[lline[a9]] | list[rline[a9]]);
																		for (a10 = 0; a10 < 14; a10++)
																		{
																			//if (!func[65535 - (list[lline[a10]] | list[rline[a10]])]) {
																				//func[65535 - (list[lline[a10]] | list[rline[a10]])] = true;
																				gpufunc[65535 - (list[13] | list[a10])] = true;
																			//}
																			//if (65535 - (list[13] | list[a10]) == 26753)
																			//{
																			//	printf("rererere");
																			//}
																		}
																	}
																}
																listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = false;
															}
														}
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
													}
												}
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
											}
										}
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
									}
								}
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
							}
						}

					}

				}


			}



		}
	}
}

__global__ void gates12(bool* gpufunc)
{
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	int a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11;

	a0 = nb % 10;
	nb -= a0;
	nb /= 10;

	a1 = nb % 15;
	nb -= a1;
	nb /= 15;

	a2 = nb % 21;
	nb -= a2;
	nb /= 21;

	a3 = nb % 28;


	if (a1 > a0 && a2 > a1 && a3 > a2)
	{



		int i, j, tmp;

		int lline[171] = { 0 }; //(7,0), (7,1), ...
		int rline[171] = { 0 };

		int list[15] = { 0 };

		bool listlookup[65536] = { 0 };


		tmp = 0;
		for (i = 0; i < 15; i++)
		{
			for (j = 0; j <= i; j++)
			{
				lline[tmp] = i;
				rline[tmp] = j;
				tmp++;
			}
		}



		list[0] = 43690;
		list[1] = 52428;
		list[2] = 61680;
		list[3] = 65280;
		listlookup[43690] = true;
		listlookup[52428] = true;
		listlookup[61680] = true;
		listlookup[65280] = true;



		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;

			if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
				list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
				listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;

				if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
					list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
					listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;

					if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
						list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
						listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
						for (a4 = a3 + 1; a4 < 36; a4++)
						{
							if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
								list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
								for (a5 = a4 + 1; a5 < 45; a5++)
								{
									if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
										list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
										for (a6 = a5 + 1; a6 < 55; a6++)
										{
											if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
												list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
												for (a7 = a6 + 1; a7 < 66; a7++)
												{
													if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
														list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
														for (a8 = a7 + 1; a8 < 78; a8++)
														{
															if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
																list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
																listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
																for (a9 = a8 + 1; a9 < 91; a9++)
																{
																	if (!listlookup[65535 - (list[lline[a9]] | list[rline[a9]])]) {
																		list[13] = 65535 - (list[lline[a9]] | list[rline[a9]]);
																		listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = true;
																		for (a10 = a9 + 1; a10 < 105; a10++)
																		{
																			if (!listlookup[65535 - (list[lline[a10]] | list[rline[a10]])]) {
																				list[14] = 65535 - (list[lline[a10]] | list[rline[a10]]);
																				for (a11 = 0; a11 < 15; a11++)
																				{
																					//if (!func[65535 - (list[lline[a11]] | list[rline[a11]])]) {
																						//func[65535 - (list[lline[a11]] | list[rline[a11]])] = true;
																						gpufunc[65535 - (list[14] | list[a11])] = true;
																					//}
																				}
																			}
																		}
																		listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = false;
																	}
																}
																listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = false;
															}
														}
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
													}
												}
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
											}
										}
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
									}
								}
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
							}
						}

					}

				}


			}



		}
	}
}

__global__ void gates13(bool* gpufunc)
{
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	int a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12;

	a0 = nb % 10;
	nb -= a0;
	nb /= 10;

	a1 = nb % 15;
	nb -= a1;
	nb /= 15;

	a2 = nb % 21;
	nb -= a2;
	nb /= 21;

	a3 = nb % 28;


	if (a1 > a0 && a2 > a1 && a3 > a2)
	{



		int i, j, tmp;

		int lline[190] = { 0 }; //(7,0), (7,1), ...
		int rline[190] = { 0 };

		int list[16] = { 0 };


		bool listlookup[65536] = { 0 };


		tmp = 0;
		for (i = 0; i < 16; i++)
		{
			for (j = 0; j <= i; j++)
			{
				lline[tmp] = i;
				rline[tmp] = j;
				tmp++;
			}
		}


		list[0] = 43690;
		list[1] = 52428;
		list[2] = 61680;
		list[3] = 65280;
		listlookup[43690] = true;
		listlookup[52428] = true;
		listlookup[61680] = true;
		listlookup[65280] = true;



		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;

			if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
				list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
				listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;

				if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
					list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
					listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;

					if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
						list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
						listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
						for (a4 = a3 + 1; a4 < 36; a4++)
						{
							if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
								list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
								for (a5 = a4 + 1; a5 < 45; a5++)
								{
									if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
										list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
										for (a6 = a5 + 1; a6 < 55; a6++)
										{
											if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
												list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
												for (a7 = a6 + 1; a7 < 66; a7++)
												{
													if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
														list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
														for (a8 = a7 + 1; a8 < 78; a8++)
														{
															if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
																list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
																listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
																for (a9 = a8 + 1; a9 < 91; a9++)
																{
																	if (!listlookup[65535 - (list[lline[a9]] | list[rline[a9]])]) {
																		list[13] = 65535 - (list[lline[a9]] | list[rline[a9]]);
																		listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = true;
																		for (a10 = a9 + 1; a10 < 105; a10++)
																		{
																			if (!listlookup[65535 - (list[lline[a10]] | list[rline[a10]])]) {
																				list[14] = 65535 - (list[lline[a10]] | list[rline[a10]]);
																				listlookup[65535 - (list[lline[a10]] | list[rline[a10]])] = true;
																				for (a11 = a10 + 1; a11 < 120; a11++)
																				{
																					if (!listlookup[65535 - (list[lline[a11]] | list[rline[a11]])]) {
																						list[15] = 65535 - (list[lline[a11]] | list[rline[a11]]);
																						for (a12 = 0; a12 < 16; a12++)
																						{
																							//if (!func[65535 - (list[lline[a12]] | list[rline[a12]])]) {
																								//func[65535 - (list[lline[a12]] | list[rline[a12]])] = true;
																								gpufunc[65535 - (list[a12] | list[15])] = true;
																							//}
																						}
																					}
																				}
																				listlookup[65535 - (list[lline[a10]] | list[rline[a10]])] = false;
																			}
																		}
																		listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = false;
																	}
																}
																listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = false;
															}
														}
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
													}
												}
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
											}
										}
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
									}
								}
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
							}
						}

					}

				}


			}



		}
	}
}

__global__ void gates14(bool* gpufunc)
{
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	int a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13;

	a0 = nb % 10;
	nb -= a0;
	nb /= 10;

	a1 = nb % 15;
	nb -= a1;
	nb /= 15;

	a2 = nb % 21;
	nb -= a2;
	nb /= 21;

	a3 = nb % 28;


	if (a1 > a0 && a2 > a1 && a3 > a2)
	{
		int i, j, tmp;

		int lline[210] = { 0 }; //(7,0), (7,1), ...
		int rline[210] = { 0 };

		int list[17] = { 0 };


		bool listlookup[65536] = { 0 };


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


		list[0] = 43690;
		list[1] = 52428;
		list[2] = 61680;
		list[3] = 65280;
		listlookup[43690] = true;
		listlookup[52428] = true;
		listlookup[61680] = true;
		listlookup[65280] = true;



		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;

			if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
				list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
				listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;

				if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
					list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
					listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;

					if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
						list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
						listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
						for (a4 = a3 + 1; a4 < 36; a4++)
						{
							if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
								list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
								for (a5 = a4 + 1; a5 < 45; a5++)
								{
									if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
										list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
										for (a6 = a5 + 1; a6 < 55; a6++)
										{
											if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
												list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
												for (a7 = a6 + 1; a7 < 66; a7++)
												{
													if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
														list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
														for (a8 = a7 + 1; a8 < 78; a8++)
														{
															if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
																list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
																listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
																for (a9 = a8 + 1; a9 < 91; a9++)
																{
																	if (!listlookup[65535 - (list[lline[a9]] | list[rline[a9]])]) {
																		list[13] = 65535 - (list[lline[a9]] | list[rline[a9]]);
																		listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = true;
																		for (a10 = a9 + 1; a10 < 105; a10++)
																		{
																			if (!listlookup[65535 - (list[lline[a10]] | list[rline[a10]])]) {
																				list[14] = 65535 - (list[lline[a10]] | list[rline[a10]]);
																				listlookup[65535 - (list[lline[a10]] | list[rline[a10]])] = true;
																				for (a11 = a10 + 1; a11 < 120; a11++)
																				{
																					if (!listlookup[65535 - (list[lline[a11]] | list[rline[a11]])]) {
																						list[15] = 65535 - (list[lline[a11]] | list[rline[a11]]);
																						listlookup[65535 - (list[lline[a11]] | list[rline[a11]])] = true;
																						for (a12 = a11 + 1; a12 < 136; a12++)
																						{
																							if (!listlookup[65535 - (list[lline[a12]] | list[rline[a12]])]) {
																								list[16] = 65535 - (list[lline[a12]] | list[rline[a12]]);
																								for (a13 = 0; a13 < 17; a13++)
																								{
																									//if (!func[65535 - (list[lline[a13]] | list[rline[a13]])]) {
																										//func[65535 - (list[lline[a13]] | list[rline[a13]])] = true;
																										gpufunc[65535 - (list[a13] | list[16])] = true;
																									//	printf("%d:%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", 65535 - (list[lline[a13]] | list[rline[a13]]), list[0], list[1], list[2], list[3], list[4], list[5], list[6], list[7], list[8], list[9], list[10], list[11], list[12], list[13], list[14], list[15], list[16]);
																									//}
																								}
																							}
																						}
																						listlookup[65535 - (list[lline[a11]] | list[rline[a11]])] = false;
																					}
																				}
																				listlookup[65535 - (list[lline[a10]] | list[rline[a10]])] = false;
																			}
																		}
																		listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = false;
																	}
																}
																listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = false;
															}
														}
														listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
													}
												}
												listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
											}
										}
										listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
									}
								}
								listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
							}
						}
					}
				}
			}
		}
	}
}

__global__ void gates10test()
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 12560) return;
	uint8_t a0, a1, a2, a3, a4, a5, a6, a7, a8, a9;

	uint8_t aa0, aa1, aa2, aa3;
	uint16_t acount = 0;
	for (aa0 = 0; aa0 < 10; aa0++)
	{
		for (aa1 = aa0 + 1; aa1 < 15; aa1++)
		{
			for (aa2 = aa1 + 1; aa2 < 21; aa2++)
			{
				for (aa3 = aa2 + 1; aa3 < 28; aa3++)
				{
					if (nb == acount)
					{
						a0 = aa0;
						a1 = aa1;
						a2 = aa2;
						a3 = aa3;
					}
					acount++;
				}
			}
		}
	}



	uint8_t i, j, tmp;

	uint8_t lline[136]; //(7,0), (7,1), ...
	uint8_t rline[136];

	uint16_t list[13];



	tmp = 0;
	for (i = 0; i < 13; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}

	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;

	list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);

					for (a4 = a3 + 1; a4 < 36; a4++)
					{
						list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
							for (a5 = a4 + 1; a5 < 45; a5++)
							{
								list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
								for (a6 = a5 + 1; a6 < 55; a6++)
									{
										list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
											for (a7 = a6 + 1; a7 < 66; a7++)
											{
												list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
													for (a8 = a7 + 1; a8 < 78; a8++)
													{
														list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
															for (a9 = 0; a9 < 13; a9++)
															{
																//if (!func[65535 - (list[12] | list[a9])]) {
																	//gpufunc[65535 - (list[12] | list[a9])] = true;
																	//func[65535 - (list[12] | list[a9])] = true;
																//}

																if (65535 - (list[12] | list[a9]) == 26753)
																{
																	printf("rererere");
																}
															}
														}

												}

										}

								}


					}

			}

__global__ void gates11test()
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 12560) return;
	uint8_t a0, a1, a2, a3, a4, a5, a6, a7, a8, a9,a10;

	uint8_t aa0, aa1, aa2, aa3;
	uint16_t acount = 0;
	for (aa0 = 0; aa0 < 10; aa0++)
	{
		for (aa1 = aa0 + 1; aa1 < 15; aa1++)
		{
			for (aa2 = aa1 + 1; aa2 < 21; aa2++)
			{
				for (aa3 = aa2 + 1; aa3 < 28; aa3++)
				{
					if (nb == acount)
					{
						a0 = aa0;
						a1 = aa1;
						a2 = aa2;
						a3 = aa3;
					}
					acount++;
				}
			}
		}
	}

	uint8_t i, j, tmp;

	uint8_t lline[153]; //(7,0), (7,1), ...
	uint8_t rline[153];

	uint16_t list[14];

	tmp = 0;
	for (i = 0; i < 13; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}

	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;

	list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
	list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
	list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
	list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);

	for (a4 = a3 + 1; a4 < 36; a4++)
	{
		list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
		for (a5 = a4 + 1; a5 < 45; a5++)
		{
			list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
			for (a6 = a5 + 1; a6 < 55; a6++)
			{
				list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
				for (a7 = a6 + 1; a7 < 66; a7++)
				{
					list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
					for (a8 = a7 + 1; a8 < 78; a8++)
					{
						list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
						for (a9 = a8+1;a9 < 91; a9++)
						{
							list[13] = 65535 - (list[lline[a9]] | list[rline[a9]]);
							for (a10 = 0; a10 < 14; a10++)
							{
								if (65535 - (list[13] | list[a10]) == 26753)
								{
									printf("rererere");
								}
							}
						}
					}

				}

			}

		}


	}

}
*/

__global__ void gates9(bool* gpufunc)
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 8980) return;


	uint8_t a0, a1, a2, a3, a4, a5, a6, a7, a8;

	uint16_t acount = 0;



	uint8_t i, j, tmp;

	uint8_t lline[120]; //(7,0), (7,1), ...
	uint8_t rline[120];

	uint16_t list[11];
	bool listlookup[65536];


	tmp = 0;
	for (i = 0; i < 12; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}

	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;
	listlookup[43690] = true;
	listlookup[52428] = true;
	listlookup[61680] = true;
	listlookup[65280] = true;

	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									if (nb == acount) goto free;
									acount++;
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}

			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}

	//printf("     %d     ", acount);




free:
	for (a4 = a3 + 1; a4 < 36; a4++)
	{
		if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
			list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
			for (a5 = a4 + 1; a5 < 45; a5++)
			{
				if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
					list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
					for (a6 = a5 + 1; a6 < 55; a6++)
					{

						if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
							list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
							for (a7 = a6 + 1; a7 < 55; a7++)
							{
								gpufunc[65535 - (65535 - (list[lline[a7]] | list[rline[a7]]) | list[10])] = true;
							}
							for (a7 = 55; a7 < 66; a7++)
							{
								if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
									for (a8 = 0; a8 < 11; a8++)
									{

										gpufunc[65535 - (65535 - (list[lline[a7]] | list[rline[a7]]) | list[a8])] = true;

									}
									gpufunc[65535 - (65535 - (list[lline[a7]] | list[rline[a7]]))] = true;

								}
							}
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
		}
	}
}

__global__ void gates10new(bool* gpufunc)
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 8980) return;


	uint8_t a0, a1, a2, a3, a4, a5, a6, a7, a8, a9;

	uint16_t acount = 0;



	uint8_t i, j, tmp;

	uint8_t lline[136]; //(7,0), (7,1), ...
	uint8_t rline[136];

	uint16_t list[11];
	bool listlookup[65536];


	tmp = 0;
	for (i = 0; i < 11; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}

	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;
	listlookup[43690] = true;
	listlookup[52428] = true;
	listlookup[61680] = true;
	listlookup[65280] = true;

	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									if (nb == acount) goto free;
									acount++;
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}

			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}

	//printf("     %d     ", acount);




free:
	for (a4 = a3 + 1; a4 < 36; a4++)
	{
		if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
			list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
			for (a5 = a4 + 1; a5 < 45; a5++)
			{
				if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
					list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
					for (a6 = a5 + 1; a6 < 55; a6++)
					{
						if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
							list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
							for (a7 = a6 + 1; a7 < 66; a7++)
							{
								if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
									listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
									for (a8 = a7 + 1; a8 < 66; a8++)
									{
										gpufunc[(list[lline[a8]] | list[rline[a8]]) & (list[lline[a7]] | list[rline[a7]])] = true;
									}
									for (a8 = 0; a8 < 11; a8++)
									{
										if (!listlookup[(65535 - list[a8]) & (list[lline[a7]] | list[rline[a7]])]) {
											for (a9 = 0; a9 < 11; a9++)
											{
												gpufunc[(list[a8] | (65535 - (list[lline[a7]] | list[rline[a7]]))) & (65535 - list[a9])] = true;
											}
											gpufunc[(list[lline[a7]] | list[rline[a7]]) & list[a8]] = true;
											gpufunc[list[a8] | (65535 - (list[lline[a7]] | list[rline[a7]]))] = true;
										}
									}
									if (!listlookup[list[lline[a7]] | list[rline[a7]]]) {
										for (a9 = 0; a9 < 11; a9++)
										{
											gpufunc[65535 - (list[lline[a7]] | list[rline[a7]] | list[a9])] = true;
										}
									}
									listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
		}
	}
}

__global__ void gates11new(bool* gpufunc)
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 8980) return;


	uint8_t a0 = 0, a1 = 0, a2 = 0, a3 = 0, a4 = 0, a5 = 0, a6 = 0, a7 = 0, a8 = 0, a9 = 0, a10 = 0, a11 = 0, a12 = 0, a13 = 0;

	uint16_t acount = 0;



	uint8_t i, j, tmp;

	uint8_t lline[153]; //(7,0), (7,1), ...
	uint8_t rline[153];

	uint16_t list[12];
	bool listlookup[65536];


	tmp = 0;
	for (i = 0; i < 12; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}

	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;
	listlookup[43690] = true;
	listlookup[52428] = true;
	listlookup[61680] = true;
	listlookup[65280] = true;

	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									if (nb == acount) goto free;
									acount++;
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}

			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}

free:
	for (a4 = a3 + 1; a4 < 36; a4++)
	{
		if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
			list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
			for (a5 = a4 + 1; a5 < 45; a5++)
			{
				if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
					list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
					for (a6 = a5 + 1; a6 < 55; a6++)
					{
						if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
							list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
							for (a7 = a6 + 1; a7 < 66; a7++)
							{
								if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
									list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
									listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
									for (a8 = a7 + 1; a8 < 78; a8++)
									{
										if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
											listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
											for (a9 = a8 + 1; a9 < 78; a9++)
											{
												gpufunc[(list[lline[a9]] | list[rline[a9]]) & (list[lline[a8]] | list[rline[a8]])] = true;
												//detectfunc(gpufunc,(list[lline[a9]] | list[rline[a9]]) & (list[lline[a8]] | list[rline[a8]]),a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13);

											}
											for (a9 = 0; a9 < 12; a9++)
											{
												if (!listlookup[(65535 - list[a9]) & (list[lline[a8]] | list[rline[a8]])]) {
													for (a10 = 0; a10 < 12; a10++)
													{
														gpufunc[(list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]]))) & (65535 - list[a10])] = true;
														//detectfunc(gpufunc, (list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]]))) & (65535 - list[a10]), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

													}
													gpufunc[(list[lline[a8]] | list[rline[a8]]) & list[a9]] = true;
													//detectfunc(gpufunc, (list[lline[a8]] | list[rline[a8]]) & list[a9], a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

													gpufunc[list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]]))] = true;
													//detectfunc(gpufunc, list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]])), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

												}
											}
											if (!listlookup[list[lline[a8]] | list[rline[a8]]]) {
												for (a10 = 0; a10 < 12; a10++)
												{
													gpufunc[65535 - (list[lline[a8]] | list[rline[a8]] | list[a10])] = true;
													//detectfunc(gpufunc, 65535 - (list[lline[a8]] | list[rline[a8]] | list[a10]), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

												}
											}
											listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = false;
										}
									}
									listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
		}
	}
}

__global__ void gates12new(bool* gpufunc)
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 8980) return;


	uint8_t a0 = 0, a1 = 0, a2 = 0, a3 = 0, a4 = 0, a5 = 0, a6 = 0, a7 = 0, a8 = 0, a9 = 0, a10 = 0, a11 = 0, a12 = 0, a13 = 0;

	uint16_t acount = 0;



	uint8_t i, j, tmp;

	uint8_t lline[171]; //(7,0), (7,1), ...
	uint8_t rline[171];

	uint16_t list[13];
	bool listlookup[65536];


	tmp = 0;
	for (i = 0; i < 13; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}

	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;
	listlookup[43690] = true;
	listlookup[52428] = true;
	listlookup[61680] = true;
	listlookup[65280] = true;

	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									if (nb == acount) goto free;
									acount++;
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}

			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}

free:
	for (a4 = a3 + 1; a4 < 36; a4++)
	{
		if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
			list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
			for (a5 = a4 + 1; a5 < 45; a5++)
			{
				if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
					list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
					for (a6 = a5 + 1; a6 < 55; a6++)
					{
						if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
							list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
							for (a7 = a6 + 1; a7 < 66; a7++)
							{
								if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
									list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
									listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
									for (a8 = a7 + 1; a8 < 78; a8++)
									{
										if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
											list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
											listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
											for (a9 = a8 + 1; a9 < 91; a9++)
											{
												if (!listlookup[65535 - (list[lline[a9]] | list[rline[a9]])]) {
													listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = true;
													for (a10 = a9 + 1; a10 < 91; a10++)
													{
														gpufunc[(list[lline[a10]] | list[rline[a10]]) & (list[lline[a9]] | list[rline[a9]])] = true;
														//detectfunc(gpufunc,(list[lline[a9]] | list[rline[a9]]) & (list[lline[a8]] | list[rline[a8]]),a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13);

													}
													for (a10 = 0; a10 < 13; a10++)
													{
														if (!listlookup[(65535 - list[a10]) & (list[lline[a9]] | list[rline[a9]])]) {
															for (a11 = 0; a11 < 13; a11++)
															{
																gpufunc[(list[a10] | (65535 - (list[lline[a9]] | list[rline[a9]]))) & (65535 - list[a11])] = true;
																//detectfunc(gpufunc, (list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]]))) & (65535 - list[a10]), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

															}
															gpufunc[(list[lline[a9]] | list[rline[a9]]) & list[a10]] = true;
															//detectfunc(gpufunc, (list[lline[a8]] | list[rline[a8]]) & list[a9], a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

															gpufunc[list[a10] | (65535 - (list[lline[a9]] | list[rline[a9]]))] = true;
															//detectfunc(gpufunc, list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]])), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

														}
													}
													if (!listlookup[list[lline[a9]] | list[rline[a9]]]) {
														for (a11 = 0; a11 < 13; a11++)
														{
															gpufunc[65535 - (list[lline[a9]] | list[rline[a9]] | list[a11])] = true;
															//detectfunc(gpufunc, 65535 - (list[lline[a8]] | list[rline[a8]] | list[a10]), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

														}
													}
													listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = false;
												}
											}
											listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = false;
										}
									}
									listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
		}
	}
}

__global__ void gates13new(bool* gpufunc)
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 8980) return;


	uint8_t a0 = 0, a1 = 0, a2 = 0, a3 = 0, a4 = 0, a5 = 0, a6 = 0, a7 = 0, a8 = 0, a9 = 0, a10 = 0, a11 = 0, a12 = 0, a13 = 0;

	uint16_t acount = 0;



	uint8_t i, j, tmp;

	uint8_t lline[190]; //(7,0), (7,1), ...
	uint8_t rline[190];

	uint16_t list[14];
	bool listlookup[65536];


	tmp = 0;
	for (i = 0; i < 14; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}

	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;
	listlookup[43690] = true;
	listlookup[52428] = true;
	listlookup[61680] = true;
	listlookup[65280] = true;

	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									if (nb == acount) goto free;
									acount++;
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}

			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}

free:
	for (a4 = a3 + 1; a4 < 36; a4++)
	{
		if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
			list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
			for (a5 = a4 + 1; a5 < 45; a5++)
			{
				if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
					list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
					for (a6 = a5 + 1; a6 < 55; a6++)
					{
						if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
							list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
							for (a7 = a6 + 1; a7 < 66; a7++)
							{
								if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
									list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
									listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
									for (a8 = a7 + 1; a8 < 78; a8++)
									{
										if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
											list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
											listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
											for (a9 = a8 + 1; a9 < 91; a9++)
											{
												if (!listlookup[65535 - (list[lline[a9]] | list[rline[a9]])]) {
													list[13] = 65535 - (list[lline[a9]] | list[rline[a9]]);
													listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = true;
													for (a10 = a9 + 1; a10 < 105; a10++)
													{
														if (!listlookup[65535 - (list[lline[a10]] | list[rline[a10]])]) {
															listlookup[65535 - (list[lline[a10]] | list[rline[a10]])] = true;
															for (a11 = a10 + 1; a11 < 105; a11++)
															{
																gpufunc[(list[lline[a11]] | list[rline[a11]]) & (list[lline[a10]] | list[rline[a10]])] = true;
																//detectfunc(gpufunc,(list[lline[a9]] | list[rline[a9]]) & (list[lline[a8]] | list[rline[a8]]),a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13);

															}
															for (a11 = 0; a11 < 14; a11++)
															{
																if (!listlookup[(65535 - list[a11]) & (list[lline[a10]] | list[rline[a10]])]) {
																	for (a12 = 0; a12 < 14; a12++)
																	{
																		gpufunc[(list[a11] | (65535 - (list[lline[a10]] | list[rline[a10]]))) & (65535 - list[a12])] = true;
																		//detectfunc(gpufunc, (list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]]))) & (65535 - list[a10]), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

																	}
																	gpufunc[(list[lline[a10]] | list[rline[a10]]) & list[a11]] = true;
																	//detectfunc(gpufunc, (list[lline[a8]] | list[rline[a8]]) & list[a9], a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

																	gpufunc[list[a11] | (65535 - (list[lline[a10]] | list[rline[a10]]))] = true;
																	//detectfunc(gpufunc, list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]])), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

																}
															}
															if (!listlookup[list[lline[a10]] | list[rline[a10]]]) {
																for (a12 = 0; a12 < 14; a12++)
																{
																	gpufunc[65535 - (list[lline[a10]] | list[rline[a10]] | list[a12])] = true;
																	//detectfunc(gpufunc, 65535 - (list[lline[a8]] | list[rline[a8]] | list[a10]), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

																}
															}
															listlookup[65535 - (list[lline[a10]] | list[rline[a10]])] = false;
														}
													}
													listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = false;
												}
											}
											listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = false;
										}
									}
									listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
		}
	}
}

__global__ void gates14new(int ty)
{
	uint16_t nb = blockIdx.x * blockDim.x + threadIdx.x;
	if (nb >= 8980) return;


	uint8_t a0 = 0, a1 = 0, a2 = 0, a3 = 0, a4 = 0, a5 = 0, a6 = 0, a7 = 0, a8 = 0, a9 = 0, a10 = 0, a11 = 0, a12 = 0, a13 = 0;

	uint16_t acount = 0;



	uint8_t i, j, tmp;

	uint8_t lline[210]; //(7,0), (7,1), ...
	uint8_t rline[210];

	uint16_t list[15];
	bool listlookup[65536];


	tmp = 0;
	for (i = 0; i < 15; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}

	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;
	listlookup[43690] = true;
	listlookup[52428] = true;
	listlookup[61680] = true;
	listlookup[65280] = true;

	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									if (nb == acount) goto free;
									acount++;
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}

			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}

free:
	//for (a4 = a3 + 1; a4 < 36; a4++)
	//{
	a4 = ty;
	if (a4 > a3 && !listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
		list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
		listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
		for (a5 = a4 + 1; a5 < 45; a5++)
		{
			if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
				list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
				listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
				for (a6 = a5 + 1; a6 < 55; a6++)
				{
					if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
						list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
						listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
						for (a7 = a6 + 1; a7 < 66; a7++)
						{
							if (!listlookup[65535 - (list[lline[a7]] | list[rline[a7]])]) {
								list[11] = 65535 - (list[lline[a7]] | list[rline[a7]]);
								listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
								for (a8 = a7 + 1; a8 < 78; a8++)
								{
									if (!listlookup[65535 - (list[lline[a8]] | list[rline[a8]])]) {
										list[12] = 65535 - (list[lline[a8]] | list[rline[a8]]);
										listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
										for (a9 = a8 + 1; a9 < 91; a9++)
										{
											if (!listlookup[65535 - (list[lline[a9]] | list[rline[a9]])]) {
												list[13] = 65535 - (list[lline[a9]] | list[rline[a9]]);
												listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = true;
												for (a10 = a9 + 1; a10 < 105; a10++)
												{
													if (!listlookup[65535 - (list[lline[a10]] | list[rline[a10]])]) {
														list[14] = 65535 - (list[lline[a10]] | list[rline[a10]]);
														listlookup[65535 - (list[lline[a10]] | list[rline[a10]])] = true;
														for (a11 = a10 + 1; a11 < 120; a11++)
														{
															if (!listlookup[65535 - (list[lline[a11]] | list[rline[a11]])]) {
																listlookup[65535 - (list[lline[a11]] | list[rline[a11]])] = true;
																for (a12 = a11 + 1; a12 < 120; a12++)
																{
																	//gpufunc[(list[lline[a12]] | list[rline[a12]]) & (list[lline[a11]] | list[rline[a11]])] = true;
																	//detectfunc(gpufunc,(list[lline[a9]] | list[rline[a9]]) & (list[lline[a8]] | list[rline[a8]]),a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13);
																	if (((list[lline[a12]] | list[rline[a12]]) & (list[lline[a11]] | list[rline[a11]])) == 59798)
																	{
																		printf("\n found: %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d \n", a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																	}
																}
																for (a12 = 0; a12 < 15; a12++)
																{
																	if (!listlookup[(65535 - list[a12]) & (list[lline[a11]] | list[rline[a11]])]) {
																		for (a13 = 0; a13 < 15; a13++)
																		{
																			//gpufunc[(list[a12] | (65535 - (list[lline[a11]] | list[rline[a11]]))) & (65535 - list[a13])] = true;
																			//detectfunc(gpufunc, (list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]]))) & (65535 - list[a10]), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																			if (((list[a12] | (65535 - (list[lline[a11]] | list[rline[a11]]))) & (65535 - list[a13])) == 59798)
																			{
																				printf("\n found: %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d \n", a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																			}
																		}
																		//gpufunc[(list[lline[a11]] | list[rline[a11]]) & list[a12]] = true;
																		//detectfunc(gpufunc, (list[lline[a8]] | list[rline[a8]]) & list[a9], a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																		if (((list[lline[a11]] | list[rline[a11]]) & list[a12]) == 59798)
																		{
																			printf("\n found: %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d \n", a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																		}


																		//gpufunc[list[a12] | (65535 - (list[lline[a11]] | list[rline[a11]]))] = true;
																		//detectfunc(gpufunc, list[a9] | (65535 - (list[lline[a8]] | list[rline[a8]])), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																		if ((list[a12] | (65535 - (list[lline[a11]] | list[rline[a11]]))) == 59798)
																		{
																			printf("\n found: %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d \n", a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																		}


																	}
																}
																if (!listlookup[list[lline[a11]] | list[rline[a11]]]) {
																	for (a13 = 0; a13 < 15; a13++)
																	{
																		//gpufunc[65535 - (list[lline[a11]] | list[rline[a11]] | list[a13])] = true;
																		//detectfunc(gpufunc, 65535 - (list[lline[a8]] | list[rline[a8]] | list[a10]), a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																		if ((65535 - (list[lline[a11]] | list[rline[a11]] | list[a13])) == 59798)
																		{
																			printf("\n found: %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d \n", a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
																		}

																	}
																}
																listlookup[65535 - (list[lline[a11]] | list[rline[a11]])] = false;
															}
														}
														listlookup[65535 - (list[lline[a10]] | list[rline[a10]])] = false;
													}
												}
												listlookup[65535 - (list[lline[a9]] | list[rline[a9]])] = false;
											}
										}
										listlookup[65535 - (list[lline[a8]] | list[rline[a8]])] = false;
									}
								}
								listlookup[65535 - (list[lline[a7]] | list[rline[a7]])] = false;
							}
						}
						listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
					}
				}
				listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
			}
		}
		listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
	}
	//}
}


int main()
{

	cudaSetDevice(0);

	int a0, a1, a2, a3, a4, a5, a6, a7;


	int count1, count2;

	int i, j, tmp, ty;

	int lline[276] = { 0 }; //(7,0), (7,1), ...
	int rline[276] = { 0 };

	int stats[20] = { 0 };
	int list[20] = { 0 };

	bool func[65536] = { 0 };
	bool func2[65536] = { 0 };


	bool listlookup[65536] = { 0 };

	std::clock_t c_start;

	cudaMalloc((void**)&gpufunc, 65536 * sizeof(bool));

	tmp = 0;
	for (i = 0; i < 20; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}


	/*

	//0 gates//
	list[0] = 43690;
	list[1] = 52428;
	list[2] = 61680;
	list[3] = 65280;
	listlookup[43690] = true;
	listlookup[52428] = true;
	listlookup[61680] = true;
	listlookup[65280] = true;
	func[43690] = true;
	func[52428] = true;
	func[61680] = true;
	func[65280] = true;
	stats[0] = 4;
	printf("0:%d\n", stats[0]);

	//1 gate//
	for (a0 = 0; a0 < 10; a0++)
	{
		if (!func[65535 - (list[lline[a0]] | list[rline[a0]])])
		{
			func[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			stats[1]++;
		}
	}
	printf("1:%d\n", stats[1]);

	//2 gates//
	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;

			for (a1 = fmax(a0 + 1, 10); a1 < 15; a1++)
			{
				if (!func[65535 - (list[lline[a1]] | list[rline[a1]])])
				{
					func[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					stats[2]++;
				}

			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("2:%d\n", stats[2]);


	//3 gates//
	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = fmax(a1 + 1, 15); a2 < 21; a2++)
					{
						if (!func[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							func[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							stats[3]++;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("3:%d\n", stats[3]);


	//4 gates//
	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;

					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;

							for (a3 = fmax(a2 + 1, 21); a3 < 28; a3++)
							{
								if (!func[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									func[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									stats[4]++;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("4:%d\n", stats[4]);


	//5 gates//
	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									for (a4 = fmax(a3 + 1, 28); a4 < 36; a4++)
									{
										if (!func[65535 - (list[lline[a4]] | list[rline[a4]])]) {
											func[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
											stats[5]++;
										}
									}
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("5:%d\n", stats[5]);


	//6 gates//
	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									for (a4 = a3 + 1; a4 < 36; a4++)
									{
										if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
											list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
											listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
											for (a5 = fmax(a4 + 1, 36); a5 < 45; a5++)
											{
												if (!func[65535 - (list[lline[a5]] | list[rline[a5]])]) {
													func[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
													stats[6]++;
												}
											}
											listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
										}
									}
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("6:%d\n", stats[6]);

	//7 gates//
	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									for (a4 = a3 + 1; a4 < 36; a4++)
									{
										if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
											list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
											listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
											for (a5 = a4 + 1; a5 < 45; a5++)
											{
												if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
													list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
													listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
													for (a6 = fmax(a5 + 1, 45); a6 < 55; a6++)
													{
														if (!func[65535 - (list[lline[a6]] | list[rline[a6]])]) {
															func[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
															stats[7]++;
														}
													}
													listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
												}
											}
											listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
										}
									}
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("7:%d\n", stats[7]);


	//8 gates//
	for (a0 = 0; a0 < 10; a0++)
	{
		if (!listlookup[65535 - (list[lline[a0]] | list[rline[a0]])]) {
			list[4] = 65535 - (list[lline[a0]] | list[rline[a0]]);
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = true;
			for (a1 = a0 + 1; a1 < 15; a1++)
			{
				if (!listlookup[65535 - (list[lline[a1]] | list[rline[a1]])]) {
					list[5] = 65535 - (list[lline[a1]] | list[rline[a1]]);
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = true;
					for (a2 = a1 + 1; a2 < 21; a2++)
					{
						if (!listlookup[65535 - (list[lline[a2]] | list[rline[a2]])]) {
							list[6] = 65535 - (list[lline[a2]] | list[rline[a2]]);
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = true;
							for (a3 = a2 + 1; a3 < 28; a3++)
							{
								if (!listlookup[65535 - (list[lline[a3]] | list[rline[a3]])]) {
									list[7] = 65535 - (list[lline[a3]] | list[rline[a3]]);
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = true;
									for (a4 = a3 + 1; a4 < 36; a4++)
									{
										if (!listlookup[65535 - (list[lline[a4]] | list[rline[a4]])]) {
											list[8] = 65535 - (list[lline[a4]] | list[rline[a4]]);
											listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = true;
											for (a5 = a4 + 1; a5 < 45; a5++)
											{
												if (!listlookup[65535 - (list[lline[a5]] | list[rline[a5]])]) {
													list[9] = 65535 - (list[lline[a5]] | list[rline[a5]]);
													listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = true;
													for (a6 = a5 + 1; a6 < 55; a6++)
													{
														if (!listlookup[65535 - (list[lline[a6]] | list[rline[a6]])]) {
															list[10] = 65535 - (list[lline[a6]] | list[rline[a6]]);
															listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = true;
															for (a7 = fmax(a6 + 1, 55); a7 < 66; a7++)
															{
																if (!func[65535 - (list[lline[a7]] | list[rline[a7]])]) {
																	func[65535 - (list[lline[a7]] | list[rline[a7]])] = true;
																	stats[8]++;
																}
															}
															listlookup[65535 - (list[lline[a6]] | list[rline[a6]])] = false;
														}
													}
													listlookup[65535 - (list[lline[a5]] | list[rline[a5]])] = false;
												}
											}
											listlookup[65535 - (list[lline[a4]] | list[rline[a4]])] = false;
										}
									}
									listlookup[65535 - (list[lline[a3]] | list[rline[a3]])] = false;
								}
							}
							listlookup[65535 - (list[lline[a2]] | list[rline[a2]])] = false;
						}
					}
					listlookup[65535 - (list[lline[a1]] | list[rline[a1]])] = false;
				}
			}
			listlookup[65535 - (list[lline[a0]] | list[rline[a0]])] = false;
		}
	}
	printf("8:%d\n", stats[8]);

	//9 gates// 13085

	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;



	cudaMemcpy(gpufunc, func, 65536 * sizeof(bool), cudaMemcpyHostToDevice);


	gates9 <<<(8980/128)+1,128>>> (gpufunc);
	cudaDeviceSynchronize();


	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);

	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("9:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

	//10 gates// 16804

	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;


	gates10new << <(8980 / 128) + 1, 128 >> > (gpufunc);
	cudaDeviceSynchronize();


	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);

	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("10:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

	//11 gates// 12210

	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;


	gates11new << <(8980 / 128) + 1, 128 >> > (gpufunc);
	cudaDeviceSynchronize();


	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);

	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("11:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);



	//12 gates// 5464
	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;

	gates12new << <(8980 / 128) + 1, 128 >> > (gpufunc);
	cudaDeviceSynchronize();


	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);

	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("12:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);


	//13 gates// 1319
	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;


	gates13new << <(8980 / 128) + 1, 128 >> > (gpufunc);
	cudaDeviceSynchronize();


	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);

	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("13:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

	*/


	//14 gates// 
	/*
	setfunc << <1,1 >> > (gpufunc);
	cudaDeviceSynchronize();

	for (ty = 17; ty < 36; ty++) {

		cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);

		c_start = std::clock();

		count1 = 0;
		for (i = 0; i < 65536; i++) if (func[i]) count1++;

		gates14new << <(8980 / 128) + 1, 128 >> > (ty);
		cudaDeviceSynchronize();


		cudaMemcpy(func2, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);

		count2 = 0;
		for (i = 0; i < 65536; i++) if (func2[i]) count2++;
		printf("14,%d:%d time:%f\n", ty,count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);


		////////////////////////////////////////
		printf("\n");
		for (i = 0; i < 65536; i++) if (func[i] != func2[i]) printf(" %d ", i);
		printf("\n");
		////////////////////////////////////////
	}
	*/

	tmp = 0;
	for (i = 0; i < 15; i++)
	{
		for (j = 0; j <= i; j++)
		{
			lline[tmp] = i;
			rline[tmp] = j;
			tmp++;
		}
	}
	printf("%d,%d\n", lline[1], rline[1]);
	printf("%d,%d\n", lline[8], rline[8]);
	printf("%d,%d\n", lline[10], rline[10]);
	printf("%d,%d\n", lline[11], rline[11]);
	printf("%d,%d\n", lline[17], rline[17]);
	printf("%d,%d\n", lline[34], rline[34]);
	printf("%d,%d\n", lline[47], rline[47]);
	printf("%d,%d\n", lline[58], rline[58]);
	printf("%d,%d\n", lline[70], rline[70]);
	printf("%d,%d\n", lline[74], rline[74]);
	printf("%d,%d\n", lline[96], rline[96]);
	printf("%d,%d\n", lline[100], rline[100]);
	printf("%d,%d\n", lline[117], rline[117]);
	cudaDeviceReset();
	return 0;
}
