
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <math.h>
#include <ctime>

#define _USE_MATH_DEFINES

static bool* gpufunc = 0;
static int* gpufunctest = 0;


__global__ void gates9(bool* gpufunc)
{
	int nb = blockIdx.x * blockDim.x + threadIdx.x;


	int a0, a1, a2, a3, a4, a5, a6, a7, a8;

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



	if (a3 > a2 && a1 > a0 && a2 > a1)
	{



		int i, j, tmp;

		int lline[120]; //(7,0), (7,1), ...
		int rline[120];

		int list[12];
		bool listlookup[65536];
		bool func[65536];

		for (i = 0; i < 65536; i++)
		{
			func[i] = gpufunc[i];
		}

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
														for (a8 = 66; a8 < 78; a8++)
														{
															if (!func[65535 - (list[lline[a8]] | list[rline[a8]])]) {
																func[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
																gpufunc[65535 - (list[lline[a8]] | list[rline[a8]])] = true;
															}
														}

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

__global__ void gates10(bool* gpufunc)
{
	int nb = blockIdx.x * blockDim.x + threadIdx.x;
	int a0, a1, a2, a3, a4, a5, a6, a7, a8, a9;

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

		int lline[136]; //(7,0), (7,1), ...
		int rline[136];

		int list[13];

		bool listlookup[65536];
		bool func[65536];

		for (i = 0; i < 65536; i++)
		{
			func[i] = gpufunc[i];
		}

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
																for (a9 = 78; a9 < 91; a9++)
																{
																	if (!func[65535 - (list[lline[a9]] | list[rline[a9]])]) {
																		func[65535 - (list[lline[a9]] | list[rline[a9]])] = true;
																		gpufunc[65535 - (list[lline[a9]] | list[rline[a9]])] = true;
																	}
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

		bool func[65536] = { 0 };
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

		for (i = 0; i < 65536; i++)
		{
			func[i] = gpufunc[i];
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
																		for (a10 = 91; a10 < 105; a10++)
																		{
																			if (!func[65535 - (list[lline[a10]] | list[rline[a10]])]) {
																				func[65535 - (list[lline[a10]] | list[rline[a10]])] = true;
																				gpufunc[65535 - (list[lline[a10]] | list[rline[a10]])] = true;
																			}
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

		bool func[65536] = { 0 };
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

		for (i = 0; i < 65536; i++)
		{
			func[i] = gpufunc[i];
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
																				for (a11 = 105; a11 < 120; a11++)
																				{
																					if (!func[65535 - (list[lline[a11]] | list[rline[a11]])]) {
																						func[65535 - (list[lline[a11]] | list[rline[a11]])] = true;
																						gpufunc[65535 - (list[lline[a11]] | list[rline[a11]])] = true;
																					}
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

		bool func[65536] = { 0 };
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

		for (i = 0; i < 65536; i++)
		{
			func[i] = gpufunc[i];
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
																						for (a12 = 120; a12 < 136; a12++)
																						{
																							if (!func[65535 - (list[lline[a12]] | list[rline[a12]])]) {
																								func[65535 - (list[lline[a12]] | list[rline[a12]])] = true;
																								gpufunc[65535 - (list[lline[a12]] | list[rline[a12]])] = true;
																							}
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

		bool func[65536] = { 0 };
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

		for (i = 0; i < 65536; i++)
		{
			func[i] = gpufunc[i];
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
																								for (a13 = 136; a13 < 153; a13++)
																								{
																									if (!func[65535 - (list[lline[a13]] | list[rline[a13]])]) {
																										func[65535 - (list[lline[a13]] | list[rline[a13]])] = true;
																										gpufunc[65535 - (list[lline[a13]] | list[rline[a13]])] = true;
																										printf("%d:%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", 65535 - (list[lline[a13]] | list[rline[a13]]), list[0], list[1], list[2], list[3], list[4], list[5], list[6], list[7], list[8], list[9], list[10], list[11], list[12], list[13], list[14], list[15], list[16]);
																									}
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


int main()
{

	cudaSetDevice(0);

	int a0, a1, a2, a3, a4, a5, a6, a7;


	int count1, count2;

	int i, j, tmp;

	int lline[276] = { 0 }; //(7,0), (7,1), ...
	int rline[276] = { 0 };

	int stats[20] = { 0 };
	int list[20] = { 0 };

	bool func[65536] = { 0 };
	int functest[65536];
	bool listlookup[65536] = { 0 };


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

	std::clock_t c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;
	for (i = 0; i < 65536; i++) if (func[i]) functest[i] = 1;

	cudaMalloc((void**)&gpufunc, 65536 * sizeof(bool));
	cudaMalloc((void**)&gpufunctest, 65536 * sizeof(int));


	cudaMemcpy(gpufunc, func, 65536 * sizeof(bool), cudaMemcpyHostToDevice);

	gates9 << <88200 / 300, 300 >> > (gpufunc);
	cudaDeviceSynchronize();

	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);
	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("9:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

	//10 gates// 16804
	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;

	cudaMemcpy(gpufunc, func, 65536 * sizeof(bool), cudaMemcpyHostToDevice);

	gates10 << <88200 / 300, 300 >> > (gpufunc);
	cudaDeviceSynchronize();

	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);
	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("10:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);



	//11 gates// 12210
	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;

	cudaMemcpy(gpufunc, func, 65536 * sizeof(bool), cudaMemcpyHostToDevice);

	gates11 << <88200 / 300, 300 >> > (gpufunc);
	cudaDeviceSynchronize();

	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);
	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("11:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

	//12 gates// 
	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;

	cudaMemcpy(gpufunc, func, 65536 * sizeof(bool), cudaMemcpyHostToDevice);

	gates12 << <88200 / 300, 300 >> > (gpufunc);
	cudaDeviceSynchronize();

	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);
	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("12:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

	//13 gates// 
	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;

	cudaMemcpy(gpufunc, func, 65536 * sizeof(bool), cudaMemcpyHostToDevice);

	gates13 << <88200 / 300, 300 >> > (gpufunc);
	cudaDeviceSynchronize();

	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);
	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("13:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);



	////////////////////////////////////////
	printf("\n");
	for (i = 0; i < 65536; i++) printf("%d", func[i]);
	printf("\n");
	////////////////////////////////////////

	//14 gates// 
	c_start = std::clock();

	count1 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count1++;

	cudaMemcpy(gpufunc, func, 65536 * sizeof(bool), cudaMemcpyHostToDevice);

	gates14 << <88200 / 300, 300 >> > (gpufunc);
	cudaDeviceSynchronize();

	cudaMemcpy(func, gpufunc, 65536 * sizeof(bool), cudaMemcpyDeviceToHost);
	count2 = 0;
	for (i = 0; i < 65536; i++) if (func[i]) count2++;
	printf("14:%d time:%f\n", count2 - count1, 1000.0 * (std::clock() - c_start) / CLOCKS_PER_SEC);

	cudaDeviceReset();
	return 0;
}
