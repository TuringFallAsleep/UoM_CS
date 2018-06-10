import java.util.ArrayList ;

public class Semaphore {

   private int value ; //value is used to show the resource statement
   //value > 0 : the number of current available resource
   //value < 0: |value| is the number of thread waiting for the resuorce
   private ArrayList <SemProc> queue ;

   public Semaphore(int i) {
      value = i ;
      queue = new ArrayList <SemProc> () ;
   }


   public synchronized void V() {
	// you need to write this
      value++;
      SemProc frontProc;
      if(value>0) return;
      if(value<=0){

         frontProc = queue.remove(0);//return the element removed form queue
         frontProc.addToReadyQueue(false);
      }
   }

   public void P(SemProc t) {
	// you need to write this too. Note it is not synchronized
	// because it may end by removing the current process, t, 
	// from the ready queue and that would leave the semaphore locked!
	// However it IS important to exclude the possibility that two 
	// processes could confuse each other - even though this is only a 
	// theorectical possibility. You will not observe it "going wrong" 
	// in the lab configuration - but you will lose a mark of you don't
	// get it right!
      
      // if (value<0){
      //    queue.add(t);
      //    t.removeFromReadyQueue();
      // }

      synchronized(this){
         value--;
      if (value >= 0) return;
      
         if(value < 0){
            queue.add(t);
         }
      }
         t.removeFromReadyQueue();
   }
}
