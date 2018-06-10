
public class RoundRobinScheduler extends Scheduler {

private int next = 0;

    public RoundRobinScheduler() {

    }

    public synchronized void run() {
    	    
    	    int num = 0;
	while (true) {
  	    int noProcs = processList.size() ; //get the size
	    if (noProcs == 0) System.exit(0) ;
	    // System.out.println("This is " + num);
	    // 	num++;
	    if (next<noProcs){

	    SimProc nextRunner = processList.get(next) ;
	    synchronized(nextRunner) { nextRunner.notify() ;}
   	    try { wait() ;}
	    catch (Exception e) { 
		System.out.println("Unexpected interrupt in run " + e) ; 
	    }
	    next++;
	    }else{
	    	next = 0;
	    }  
	}
    }
    public synchronized void removeProcess(SimProc t){
		super.removeProcess(t);
		next--;
		System.out.println("remove");
	}

 //    public synchronized void run() {
 //    	    int next = 0;
 //    	    int num = 0;
	// while (true) {
 //  	    int noProcs = processList.size() ; //get the size
	//     if (noProcs == 0) System.exit(0) ;
	//     System.out.println("This is " + num);
	//     	num++;
	//     	 SimProc nextRunner = processList.get(next) ;
	//     if (next<noProcs){
	    	
	   
	//     synchronized(nextRunner) { 
	//     	nextRunner.notify();}
	//     	try{System.out.println("waiting...");
	//     	wait();
	//     	}
	//     	catch (Exception e){
	//     		System.out.println("Unexpected interrupt in run " + e);
	//     	}
	//     next++;
	//     }else{
	//     	next = 0;
	//     }  

	//     synchronized(nextRunner){
	//     	synchronized(this){
	//     		processList.remove(nextRunner);
	//     		notify();
	//     	}
	//     	try{nextRunner.wait();}
	//     	catch(Exception e){
	//     		System.out.println("Unexpected wakeup " + e);
	//     	}
	//     }
	// }
 //    }


 // public void removeProcess(SemProc t) {
	// synchronized(t) {
	//     synchronized(this) {
	//         processList.remove(t) ;
 //                notify() ;  // it is always the running process which removes itself
	// 		// so need to schedule another
 //            }
	//     try { t.wait() ;} // and send it back to sleep
 // 	    catch (Exception e) { 
	// 	System.out.println("Unexpected wakeup " + e) ;
	//     }
	// }
 //   }	

 //   public synchronized void run() {
	// while (true) {
	//     if (processList.isEmpty()) {
	// 	System.out.println("Nothing left to run! Exiting.") ;
	// 	System.exit(0) ;
	//     }
	//     SemProc nextRunner = processList.get(0) ;
	//     synchronized(nextRunner) { nextRunner.notify() ; }
	//     try { wait() ; }  // until that process removes itself
	//     catch (Exception e) { 
 //                System.out.println("Unexpected interrupt in run " + e) ; 
	//     }
 //        }
 //    }





}
