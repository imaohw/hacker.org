using System;
namespace Sharper
{
	internal class Program
	{
		private static void Main(string[] args)
		{
			Console.WriteLine("calculating...");
			int num = 99;
			for (int i = num; i >= 0; i--)
			{
				Console.WriteLine(i);
				int num2 = Program.calc(num - i);
				Console.WriteLine("val: " + num2.ToString());
			}
		}
		private static int calc(int num)
		{
			int num2 = 0;
			for (int i = 0; i < num; i++)
			{
				for (int j = 0; j < num; j++)
				{
					for (int k = 0; k < num; k++)
					{
						for (int l = 0; l < num; l++)
						{
							for (int m = 0; m < num; m++)
							{
								string text = string.Concat(new string[]
								{
									i.ToString(), 
									" to ", 
									j.ToString(), 
									" to ", 
									k.ToString(), 
									" to ", 
									l.ToString(), 
									" to ", 
									m.ToString()
								});
								num2 += text.Length;
							}
						}
					}
				}
			}
			return num2;
		}
	}
}
