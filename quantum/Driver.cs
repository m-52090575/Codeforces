using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Solution
{
    class Driver
    {
        static void Main(string[] args)
        {
            using (var qsim = new QuantumSimulator())
            {
                // Try initial values
                Result[] initials = new Result[] { Result.Zero, Result.One };
                foreach (Result initial in initials)
                {
                    var res = Hello.Run(qsim).Result;
                    System.Console.WriteLine(
                        $"{res,-4}");
                }
            }

            System.Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }
    }
}