class Cell_c
{
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  // FIELD
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  int x;
  int y;
  int size_c;
  int capacity_c;
  int occupation_c;
  // TODO activity

  color activity_c = color(#D2E87E);

  int cluster_id_c;

  /////////////////////////////////////////////////////////////////////////////////////////////////////
  // CONSTRUCTOR
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  Cell_c(int x, int y, int capacity_c, int size_c, int cluster_id_c)
  {
    this.x = x;
    this.y = y;
    this.size_c = size_c;
    this.capacity_c = capacity_c;
    this.occupation_c = 0; //(int)random(capacity);
    this.cluster_id_c = cluster_id_c;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  // METHODS
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  void Draw_c()
  {
    if (capacity_c > 0)
    {
      pushMatrix();
      translate(x, y, capacity_c/2);
      fill(color(115));
      noFill();
      strokeWeight(0.75); 
      stroke(color(0));
      box(size_c, size_c, capacity_c);
      popMatrix();
      if (occupation_c > 0)
      {
        pushMatrix();
        translate(x, y, occupation_c/2);
        noStroke();
        fill(activity_c);
        box(size_c, size_c, occupation_c);
        popMatrix();
      }
    }
  } 
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  int Colonize(int agent)/// @return: remaining agents
  {
    if (isFull())
      return agent; //return all initial agents as remaining agents


    int rest = occupation_c + agent - capacity_c;
    //if agents remain
    if (rest >= 0)
      this.occupation_c = capacity_c; //full capacity reached
    else
      this.occupation_c += agent;

    return rest;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  boolean isFull()
  {
    return occupation_c >= capacity_c;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////  
  void ResetCapacity_c()
  {
    this.occupation_c = 0;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  void FillCapacity_c()
  {
    this.occupation_c = capacity_c;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
}