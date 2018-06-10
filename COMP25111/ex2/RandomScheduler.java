import java.util.Random ;

public class RandomScheduler extends Scheduler {

private Random randGen ;

    public RandomScheduler() {
	randGen = new Random() ;

    }

    public synchronized void run() {
    	   	    int num = 0;

	while (true) {
		System.out.println("This is " + num);
	    	num++;
  	    int noProcs = processList.size() ;
	    if (noProcs == 0) System.exit(0) ;
	    int next = Math.abs(randGen.nextInt()) % noProcs ;
	    SimProc nextRunner = processList.get(next) ;
	    synchronized(nextRunner) { nextRunner.notify() ;}
   	    try { wait() ;}
	    catch (Exception e) { 
		System.out.println("Unexpected interrupt in run " + e) ; 
	    }
	}
    }
}
