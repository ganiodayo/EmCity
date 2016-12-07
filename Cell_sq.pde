class Cell_sq
{
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  // FIELD
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  int x;
  int y;
  int size_sq;
  int capacity_sq;
  int occupation_sq;
  // TODO activity

  color activity_sq = color(#A2B93A);

  int cluster_id_sq;

  /////////////////////////////////////////////////////////////////////////////////////////////////////
  // CONSTRUCTOR
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  Cell_sq(int x, int y, int capacity_sq, int size_sq, int cluster_id_sq)
  {
    this.x = x;
    this.y = y;
    this.size_sq = size_sq;
    this.capacity_sq = capacity_sq;
    this.occupation_sq = 0; //(int)random(capacity);
    this.cluster_id_sq = cluster_id_sq;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  // METHODS
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  void Draw_sq()
  {
    if (capacity_sq > 0)
    {
      pushMatrix();
      translate(x, y, capacity_sq/2);
      fill(color(115));
      noFill();
      strokeWeight(0.6); 
      stroke(100);
      box(size_sq, size_sq, capacity_sq);
      popMatrix();
      if (occupation_sq > 0)
      {
        pushMatrix();
        translate(x, y, occupation_sq/2);
        noStroke();
        fill(activity_sq);
        box(size_sq, size_sq, occupation_sq);
        popMatrix();
      }
    }
  } 
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  int Colonize(int agent)/// @return: remaining agents
  {
    if (isFull())
      return agent; //return all initial agents as remaining agents


    int rest = occupation_sq + agent - capacity_sq;
    //if agents remain
    if (rest >= 0)
      this.occupation_sq = capacity_sq; //full capacity reached
    else
      this.occupation_sq += agent;

    return rest;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  boolean isFull()
  {
    return occupation_sq >= capacity_sq;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////  
  void ResetCapacity_sq()
  {
    this.occupation_sq = 0;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  void FillCapacity_sq()
  {
    this.occupation_sq = capacity_sq;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
}