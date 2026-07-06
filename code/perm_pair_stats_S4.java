package norgate;

public class norgates2permtrue {
	public static final int NB_LINES = 10;
	
	public static void main(String[] args) 
	{
		int a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29;
		int[] sq = new int[NB_LINES];
		
		long startTime = System.nanoTime(); 
		
		int i,j,k,tmp;
	
		for(i=0;i<NB_LINES;i++) sq[i]=((i+2)*(i+3))/2;
		
		int[] lline = new int[sq[NB_LINES-1]]; //(7,0), (7,1), ...
		int[] rline = new int[sq[NB_LINES-1]];
		
		boolean[] func = new boolean[16];
		int[] stats = new int[NB_LINES];
		int[] list = new int[NB_LINES];
		
		int[][] nortable = new int[16][16];
		
		for(i=0;i<16;i++) for(j=0;j<16;j++) nortable[i][j]=15-(i | j);
		
		int[] permlist = new int[24];
		int[] perm1 = new int[24];
		int[] perm2 = new int[24];
		int[] perm3 = new int[24];
		int[] permcost = new int[24];
		int[] permtmp = new int[4];
		int permcount = 24;
		
		boolean[] listlookup = new boolean[16];
		
		int tmp1,tmp2,tmp3,pow;
		
		for(i=0;i<24;i++)
		{
			permlist[i]=i;
			permtmp=perm(4,i);
			
			pow=1;
			tmp1=0;
			tmp2=0;
			tmp3=0;
			for(j=0;j<4;j++)
			{
				tmp1+=pow*(permtmp[j]%2);
				permtmp[j]-=permtmp[j]%2;
				permtmp[j]/=2;
				
				tmp2+=pow*(permtmp[j]%2);
				
				pow*=2;
			}
			
			perm1[i]=tmp1;
			perm2[i]=tmp2;
		}
		
	
		tmp=0;
		for(i=0;i<NB_LINES;i++)
		{
			for(j=0;j<=i;j++)
			{
				lline[tmp]=i;
				rline[tmp]=j;
				tmp++;
			}
		}
		
		
		
		
		//0 gates//
		func[10]=true;
		func[12]=true;
		list[0]=10;
		list[1]=12;
		listlookup[10]=true;
		listlookup[12]=true;
		for(i=0;i<permcount;i++)
		{
			if(listlookup[perm1[i]]&& listlookup[perm2[i]])
			{
				stats[0]++;
				permcost[permlist[i]]=0;
				permcount--;
				perm1[i]=perm1[permcount];
				perm2[i]=perm2[permcount];
				permlist[i]=permlist[permcount];
				
			}
		}
		
		//1 gate//
		for(a0=0;a0<3;a0++)
		{
			if(!listlookup[15-(list[lline[a0]] | list[rline[a0]])]) {
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			for(i=0;i<permcount;i++)
			{
				if(listlookup[perm1[i]]&& listlookup[perm2[i]])
				{
					stats[1]++;
					permcost[permlist[i]]=1;
					permcount--;
					perm1[i]=perm1[permcount];
					perm2[i]=perm2[permcount];
					permlist[i]=permlist[permcount];
				}
			}
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;}
		}
		
		//2 gates//
		for(a0=0;a0<3;a0++)
		{
			if(!listlookup[15-(list[lline[a0]] | list[rline[a0]])]) {
			list[2]=15-(list[lline[a0]] | list[rline[a0]]);
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			
			for(a1=a0+1;a1<6;a1++)
			{
				if(!listlookup[15-(list[lline[a1]] | list[rline[a1]])]) {
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=true;
				for(i=0;i<permcount;i++)
				{
					if(listlookup[perm1[i]]&& listlookup[perm2[i]])
					{
						stats[2]++;
						permcost[permlist[i]]=2;
						permcount--;
						perm1[i]=perm1[permcount];
						perm2[i]=perm2[permcount];
						
						permlist[i]=permlist[permcount];
					}
				}
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=false;}
				
			}
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;}
			
		}
		
		//3 gates//
		for(a0=0;a0<3;a0++)
		{
			if(!listlookup[15-(list[lline[a0]] | list[rline[a0]])]) {
			list[2]=15-(list[lline[a0]] | list[rline[a0]]);
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			for(a1=a0+1;a1<6;a1++)
			{
				if(!listlookup[15-(list[lline[a1]] | list[rline[a1]])]) {
				list[3]=15-(list[lline[a1]] | list[rline[a1]]);
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=true;
				for(a2=a1+1;a2<10;a2++)
				{
					if(!listlookup[15-(list[lline[a2]] | list[rline[a2]])]) {
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=true;
					for(i=0;i<permcount;i++)
					{
						if(listlookup[perm1[i]]&& listlookup[perm2[i]])
						{
							stats[3]++;
							permcost[permlist[i]]=3;
							permcount--;
							perm1[i]=perm1[permcount];
							perm2[i]=perm2[permcount];
							
							permlist[i]=permlist[permcount];
							
						}
					}
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=false;}
				}
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=false;}
			}
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;}
		}
		
		//4 gates//
		for(a0=0;a0<3;a0++)
		{
			if(!listlookup[15-(list[lline[a0]] | list[rline[a0]])]) {
			list[2]=15-(list[lline[a0]] | list[rline[a0]]);
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			for(a1=a0+1;a1<6;a1++)
			{
				if(!listlookup[15-(list[lline[a1]] | list[rline[a1]])]) {
				list[3]=15-(list[lline[a1]] | list[rline[a1]]);
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=true;
				
				for(a2=a1+1;a2<10;a2++)
				{
					if(!listlookup[15-(list[lline[a2]] | list[rline[a2]])]) {
					list[4]=15-(list[lline[a2]] | list[rline[a2]]);
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=true;
					
					for(a3=a2+1;a3<15;a3++)
					{
						if(!listlookup[15-(list[lline[a3]] | list[rline[a3]])]) {
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=true;
						for(i=0;i<permcount;i++)
						{
							if(listlookup[perm1[i]]&& listlookup[perm2[i]])
							{
								stats[4]++;
								permcost[permlist[i]]=4;
								permcount--;
								perm1[i]=perm1[permcount];
								perm2[i]=perm2[permcount];
								
								permlist[i]=permlist[permcount];
								
							}
						}
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=false;}
					}
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=false;}
				}
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=false;}
			}	
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;}
		}
		

		//5 gates//
		for(a0=0;a0<3;a0++)
		{
			if(!listlookup[15-(list[lline[a0]] | list[rline[a0]])]) {
			list[2]=15-(list[lline[a0]] | list[rline[a0]]);
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			for(a1=a0+1;a1<6;a1++)
			{
				if(!listlookup[15-(list[lline[a1]] | list[rline[a1]])]) {
				list[3]=15-(list[lline[a1]] | list[rline[a1]]);
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=true;
				for(a2=a1+1;a2<10;a2++)
				{
					if(!listlookup[15-(list[lline[a2]] | list[rline[a2]])]) {
					list[4]=15-(list[lline[a2]] | list[rline[a2]]);
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=true;
					for(a3=a2+1;a3<15;a3++)
					{
						if(!listlookup[15-(list[lline[a3]] | list[rline[a3]])]) {
						list[5]=15-(list[lline[a3]] | list[rline[a3]]);
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=true;
						for(a4=a3+1;a4<21;a4++)
						{
							if(!listlookup[15-(list[lline[a4]] | list[rline[a4]])]) {
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=true;
							for(i=0;i<permcount;i++)
							{
								if(listlookup[perm1[i]]&& listlookup[perm2[i]])
								{
									permtmp=perm(4,permlist[i]);
									stats[5]++;
									permcost[permlist[i]]=5;
									permcount--;
									perm1[i]=perm1[permcount];
									perm2[i]=perm2[permcount];
									
									permlist[i]=permlist[permcount];
								}
							}
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=false;}
						}
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=false;}
					}
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=false;}
				}
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=false;}
			}	
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;}
		}
		
		
		
		//6 gates//
		for(a0=0;a0<3;a0++)
		{
			list[2]=15-(list[lline[a0]] | list[rline[a0]]);
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			for(a1=a0+1;a1<6;a1++)
			{
				list[3]=15-(list[lline[a1]] | list[rline[a1]]);
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=true;
				for(a2=a1+1;a2<10;a2++)
				{
					list[4]=15-(list[lline[a2]] | list[rline[a2]]);
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=true;
					for(a3=a2+1;a3<15;a3++)
					{
						list[5]=15-(list[lline[a3]] | list[rline[a3]]);
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=true;
						for(a4=a3+1;a4<21;a4++)
						{
							list[6]=15-(list[lline[a4]] | list[rline[a4]]);
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=true;
							for(a5=a4+1;a5<28;a5++)
							{
								listlookup[15-(list[lline[a5]] | list[rline[a5]])]=true;
								for(i=0;i<permcount;i++)
								{
									if(listlookup[perm1[i]]&& listlookup[perm2[i]])
									{
										permtmp=perm(4,permlist[i]);
										stats[6]++;
										permcost[permlist[i]]=6;
										permcount--;
										perm1[i]=perm1[permcount];
										perm2[i]=perm2[permcount];
										
										permlist[i]=permlist[permcount];
									}
								}
								listlookup[15-(list[lline[a5]] | list[rline[a5]])]=false;
							}
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=false;
						}
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=false;
					}
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=false;
				}
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=false;
			}	
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;
		}
		/*
		//7 gates//
		for(a0=0;a0<3;a0++)
		{
			list[2]=15-(list[lline[a0]] | list[rline[a0]]);
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			for(a1=a0+1;a1<6;a1++)
			{
				list[3]=15-(list[lline[a1]] | list[rline[a1]]);
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=true;
				for(a2=a1+1;a2<10;a2++)
				{
					list[4]=15-(list[lline[a2]] | list[rline[a2]]);
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=true;
					for(a3=a2+1;a3<15;a3++)
					{
						list[5]=15-(list[lline[a3]] | list[rline[a3]]);
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=true;
						for(a4=a3+1;a4<21;a4++)
						{
							list[6]=15-(list[lline[a4]] | list[rline[a4]]);
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=true;
							for(a5=a4+1;a5<28;a5++)
							{
								list[7]=15-(list[lline[a5]] | list[rline[a5]]);
								listlookup[15-(list[lline[a5]] | list[rline[a5]])]=true;
								for(a6=a5+1;a6<36;a6++)
								{
									listlookup[15-(list[lline[a6]] | list[rline[a6]])]=true;
									for(i=0;i<permcount;i++)
									{
										if(listlookup[perm1[i]]&& listlookup[perm2[i]])
										{
											stats[7]++;
											permcost[permlist[i]]=7;
											permcount--;
											perm1[i]=perm1[permcount];
											perm2[i]=perm2[permcount];
											
											permlist[i]=permlist[permcount];
										}
									}
									listlookup[15-(list[lline[a6]] | list[rline[a6]])]=false;
								}
								listlookup[15-(list[lline[a5]] | list[rline[a5]])]=false;
							}
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=false;
						}
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=false;
					}
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=false;
				}
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=false;
			}	
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;
		}
		
		
		//8 gates//
		for(a0=0;a0<3;a0++)
		{
			list[2]=15-(list[lline[a0]] | list[rline[a0]]);
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			for(a1=a0+1;a1<6;a1++)
			{
				list[3]=15-(list[lline[a1]] | list[rline[a1]]);
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=true;
				for(a2=a1+1;a2<10;a2++)
				{
					list[4]=15-(list[lline[a2]] | list[rline[a2]]);
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=true;
					for(a3=a2+1;a3<15;a3++)
					{
						list[5]=15-(list[lline[a3]] | list[rline[a3]]);
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=true;
						for(a4=a3+1;a4<21;a4++)
						{
							list[6]=15-(list[lline[a4]] | list[rline[a4]]);
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=true;
							for(a5=a4+1;a5<28;a5++)
							{
								list[7]=15-(list[lline[a5]] | list[rline[a5]]);
								listlookup[15-(list[lline[a5]] | list[rline[a5]])]=true;
								for(a6=a5+1;a6<36;a6++)
								{
									list[8]=15-(list[lline[a6]] | list[rline[a6]]);
									listlookup[15-(list[lline[a6]] | list[rline[a6]])]=true;
									for(a7=a6+1;a7<45;a7++)
									{
										listlookup[15-(list[lline[a7]] | list[rline[a7]])]=true;
										for(i=0;i<permcount;i++)
										{
											if(listlookup[perm1[i]]&& listlookup[perm2[i]])
											{
												stats[8]++;
												permcost[permlist[i]]=8;
												permcount--;
												perm1[i]=perm1[permcount];
												perm2[i]=perm2[permcount];
												
												permlist[i]=permlist[permcount];
											}
										}
										listlookup[15-(list[lline[a7]] | list[rline[a7]])]=false;
									}
									listlookup[15-(list[lline[a6]] | list[rline[a6]])]=false;
								}
								listlookup[15-(list[lline[a5]] | list[rline[a5]])]=false;
							}
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=false;
						}
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=false;
					}
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=false;
				}
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=false;
			}	
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;
		}
		
		
		//9 gates//
		for(a0=0;a0<3;a0++)
		{
			list[2]=15-(list[lline[a0]] | list[rline[a0]]);
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=true;
			for(a1=a0+1;a1<6;a1++)
			{
				list[3]=15-(list[lline[a1]] | list[rline[a1]]);
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=true;
				for(a2=a1+1;a2<10;a2++)
				{
					list[4]=15-(list[lline[a2]] | list[rline[a2]]);
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=true;
					for(a3=a2+1;a3<15;a3++)
					{
						list[5]=15-(list[lline[a3]] | list[rline[a3]]);
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=true;
						for(a4=a3+1;a4<21;a4++)
						{
							list[6]=15-(list[lline[a4]] | list[rline[a4]]);
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=true;
							for(a5=a4+1;a5<28;a5++)
							{
								list[7]=15-(list[lline[a5]] | list[rline[a5]]);
								listlookup[15-(list[lline[a5]] | list[rline[a5]])]=true;
								for(a6=a5+1;a6<36;a6++)
								{
									list[8]=15-(list[lline[a6]] | list[rline[a6]]);
									listlookup[15-(list[lline[a6]] | list[rline[a6]])]=true;
									for(a7=a6+1;a7<45;a7++)
									{
										list[9]=15-(list[lline[a7]] | list[rline[a7]]);
										listlookup[15-(list[lline[a7]] | list[rline[a7]])]=true;
										for(a8=a7+1;a8<55;a8++)
										{
											listlookup[15-(list[lline[a8]] | list[rline[a8]])]=true;
											for(i=0;i<permcount;i++)
											{
												if(listlookup[perm1[i]]&& listlookup[perm2[i]])
												{
													System.out.println(permlist[i]);
													stats[9]++;
													permcost[permlist[i]]=9;
													permcount--;
													perm1[i]=perm1[permcount];
													perm2[i]=perm2[permcount];
													
													permlist[i]=permlist[permcount];
												}
											}
											listlookup[15-(list[lline[a8]] | list[rline[a8]])]=false;
										}
										listlookup[15-(list[lline[a7]] | list[rline[a7]])]=false;
									}
									listlookup[15-(list[lline[a6]] | list[rline[a6]])]=false;
								}
								listlookup[15-(list[lline[a5]] | list[rline[a5]])]=false;
							}
							listlookup[15-(list[lline[a4]] | list[rline[a4]])]=false;
						}
						listlookup[15-(list[lline[a3]] | list[rline[a3]])]=false;
					}
					listlookup[15-(list[lline[a2]] | list[rline[a2]])]=false;
				}
				listlookup[15-(list[lline[a1]] | list[rline[a1]])]=false;
			}	
			listlookup[15-(list[lline[a0]] | list[rline[a0]])]=false;
		}	
		*/
		
		int[] finalstats = new int[6*6];
		int n1,n2;
		
		for(i=0;i<24;i++)
		{
			n1=permcost[i];
			n2=permcost[perminv(4,i)];
			finalstats[6*n1+n2]++;
		}
		
		for(i=0;i<36;i++) System.out.println(i+":"+finalstats[i]);
		System.out.println("////////////");
		for(i=0;i<10;i++) System.out.println(i+":"+stats[i]);
		System.out.println("////////////");
		for(i=0;i<24;i++) System.out.println(i+":"+permcost[i]+","+permcost[perminv(4,i)]);
		System.out.println("////////////");
		for(i=0;i<24;i++)
		{
			permtmp=perm(4,i);
			System.out.println(i+":"+permtmp[0]+","+permtmp[1]+","+permtmp[2]+","+permtmp[3]+":"+permcost[i]);
		}
		System.out.println((double)(System.nanoTime() - startTime)/(double)1000000000L);
	}
	
	
	 public static int[] perm(int n, int k)  
	 {  
	      int i, ind, m=k;  
	      int[] permuted = new int[n];  
	      int[] elems = new int[n];  
	      for(i=0;i<n;i++) elems[i]=i;  
	      for(i=0;i<n;i++)  
	      {  
	           ind=m%(n-i);  
	           m=m/(n-i);  
	           permuted[i]=elems[ind];  
	           elems[ind]=elems[n-i-1];  
	      }  
	      return permuted;  
	 }  
	 public static int inv(int[] perm)  
	 {  
	      int i, k=0, m=1;  
	      int n=perm.length;  
	      int[] pos = new int[n];  
	      int[] elems = new int[n];  
	      for(i=0;i<n;i++) {pos[i]=i; elems[i]=i;}  
	      for(i=0;i<n-1;i++)  
	      {  
	           k+=m*pos[perm[i]];  
	           m=m*(n-i);  
	           pos[elems[n-i-1]]=pos[perm[i]];  
	           elems[pos[perm[i]]]=elems[n-i-1];  
	      }  
	      return k;  
	 }
	 
	 public static int[] permgroup(int[] perm1, int[] perm2)
	 {
		 int[] ret = new int[perm1.length];
		 
		 for(int i=0;i<perm1.length;i++) ret[i]=perm1[perm2[i]];
		 
		 return ret;
	 }
	 
	 public static int permidentityidx(int n)
	 {
		 int[] tmp = new int[n];
		 
		 for(int i=0;i<n;i++) tmp[i]=i;
		 
		 return inv(tmp);
	 }
	 
	 public static int permorder(int n, int k)
	 {
		 int ret=1;
		 int idd = permidentityidx(n);
		 int[] perm = perm(n,k);
		 int[] tmp = perm(n,k);
		 
		 while(k!=idd)
		 {
			 tmp=permgroup(tmp,perm);
			 k=inv(tmp);
			 ret++;
		 }
		 
		 
		 return ret;
	 }
	 
	 public static int perminv(int n, int k)
	 {
		 int[] permtmp = new int[n];
		 int[] permnew = new int[n];
		 permtmp = perm(n,k);
		 
		 for(int i=0;i<n;i++) permnew[permtmp[i]]=i;
		 
		 return inv(permnew);
	 }
}
