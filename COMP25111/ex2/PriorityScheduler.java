// import java.util.Random ;

public class PriorityScheduler extends Scheduler {

// private Random randGen ;
private int next = 0;

    public PriorityScheduler() {
    	// randGen = new Random() ;

    	// count = SimProc.getCount();
    }

         // public synchronized void run() {
 //    	    int next = 0;
 //    	    int count = 4;
 //    	    int countNew;
	// while (true) {
 //  	    int noProcs = processList.size() ; //get the size
	//     if (noProcs == 0) System.exit(0) ;
	//     next = Math.abs(randGen.nextInt()) % noProcs ;

	//     while (count <= 4){
	//     	noProcs = processList.size();
	//     	if (noProcs == 0) System.exit(0);
	//     	SimProc nextRunner = processList.get(next) ;
	//     	count = nextRunner.getCount();
	//     	// System.out.println(count + " non-negative result(s) the process still needs to compute.");
	//     synchronized(nextRunner) { nextRunner.notify() ;}
 //   	    try { wait() ;}
	//     catch (Exception e) { 
	// 	System.out.println("Unexpected interrupt in run " + e) ; 
	//     }    
	//     countNew = nextRunner.getCount();
	//     if(countNew == 4){
	//     	break;
	//     }
	//     } 
	// }
 //    }


     public synchronized void run() {
    	    
    	    int nextPriority = 4;
	while (true) {
  	    int noProcs = processList.size() ; //get the size
	    if (noProcs == 0) System.exit(0) ;
	    // next = Math.abs(randGen.nextInt()) % noProcs ;
	    	SimProc nextRunner = processList.get(next) ;
	    	nextPriority = nextRunner.getCount();
	    	for(int i=1; i<noProcs;i++){
	    		SimProc currentRunner = processList.get(i);
	    		int currentPriority = currentRunner.getCount();
	    		if (nextPriority < currentPriority){
	    			nextPriority = currentPriority;
	    			nextRunner = currentRunner;
	    		}
	    	}
	    	// System.out.println(count + " non-negative result(s) the process still needs to compute.");
	    synchronized(nextRunner) { nextRunner.notify() ;}
   	    try { wait() ;}
	    catch (Exception e) { 
		System.out.println("Unexpected interrupt in run " + e) ; 
	    }    	     
	}
    }
    public synchronized void removeProcess(SimProc t){
		super.removeProcess(t);
		
	
	}
}