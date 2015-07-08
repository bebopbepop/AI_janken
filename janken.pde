char[][] te = new char[101][10000];   
int[]winrate = new int[10000]; 
int g,c,p=0;


void setup(){
  
size(800,800); 
String lines[] = loadStrings("syain_sample.txt");

println(lines.length); // 行数を取得
// 一行ずつ出力

for (int i = 0; i < lines.length; i++)
{
  println(lines[i]);
  for(int j=0;j<10000;j++){
    te[i][j] = lines[i].charAt(j);
  }
  
}

for(int l=0;l<200;l++){
//  stepCnt(l);
  te[100][5*l]='G';
  te[100][5*l+1]='G';
  te[100][5*l+2]='G';
  te[100][5*l+3]='C';
  te[100][5*l+4]='C';
}



  
int maxnum=0;
int max=0;

for(int r=0;r<101;r++){
  winrate[r]=result(r);
  if(winrate[r]>max){
    max=winrate[r];
    maxnum=r;
  }
 print(battleX(100,r)-battleY(100,r));
 print(" ーーー ");
 println(r);

}

  /*
  for(int m=0;m<5000;m++){
    if(te[100][m]=='G')te[100][m]='P';
    else if(te[100][m]=='C')te[100][m]='G';
    else if(te[100][m]=='P')te[100][m]='C';
    winrate[m]=result(100);
    if(winrate[m]>max){
    max=winrate[m];
    maxnum=m;
    }
    if(te[100][m]=='G')te[100][m]='C';
    else if(te[100][m]=='C')te[100][m]='P';
    else if(te[100][m]=='P')te[100][m]='G';
    
  }
  */
  

println(max);
println(maxnum);

//println(lines[24]);

//drawMatch(100,3);

}

int result(int x){
  int win=0;
  for(int i=0;i<100;i++){
    if(i==x){
      i++;
    }
    int X,Y=0;
    X=battleX(x,i);
    Y=battleY(x,i);
    if(X>Y){
      win++;
    }
  }
  return win;
}

int battleX(int x,int y){
  int xPoint=0;
  int yPoint=0;
  
  for(int i=0;i<10000;i++){
    if(te[x][i] =='G'){
      if(te[y][i]=='G'){
      
      }else if(te[y][i]=='C'){
        xPoint += 3;
      }else if(te[y][i]=='P'){
        yPoint += 4;
      }
      
    }else if(te[x][i]=='C'){
      if(te[y][i]=='G'){
        yPoint += 3;
      }else if(te[y][i]=='C'){
      
      }else if(te[y][i]=='P'){
        xPoint += 3;
      }
      
    
    }else if(te[x][i]=='P'){
      if(te[y][i]=='G'){
        xPoint += 4;
      }else if(te[y][i]=='C'){
        yPoint += 3;
      }else if(te[y][i]=='P'){
      
      }
    }
  }
  return xPoint;
}
 
int battleY(int x,int y){
  int xPoint=0;
  int yPoint=0;
  
  for(int i=0;i<10000;i++){
    if(te[x][i] =='G'){
      if(te[y][i]=='G'){
      
      }else if(te[y][i]=='C'){
        xPoint += 3;
      }else if(te[y][i]=='P'){
        yPoint += 4;
      }
      
    }else if(te[x][i]=='C'){
      if(te[y][i]=='G'){
        yPoint += 3;
      }else if(te[y][i]=='C'){
      
      }else if(te[y][i]=='P'){
        xPoint += 3;
      }
      
    
    }else if(te[x][i]=='P'){
      if(te[y][i]=='G'){
        xPoint += 4;
      }else if(te[y][i]=='C'){
        yPoint += 3;
      }else if(te[y][i]=='P'){
      
      }
    }
  }
  return yPoint;
}

void drawMatch(int x,int y){
  
for(int i=0;i<10000;i++){
    int flag=0;
    if(te[x][i] =='G'){
      if(te[y][i]=='G'){
        flag=0;
      }else if(te[y][i]=='C'){
        flag=1;
      }else if(te[y][i]=='P'){
        flag=2;
      }
      
    }else if(te[x][i]=='C'){
      if(te[y][i]=='G'){
        flag=2;
      }else if(te[y][i]=='C'){
        flag=0;
      }else if(te[y][i]=='P'){
        flag=1;
      }
      
    
    }else if(te[x][i]=='P'){
      if(te[y][i]=='G'){
        flag=1;
      }else if(te[y][i]=='C'){
        flag=2;
      }else if(te[y][i]=='P'){
        flag=0;
      }
    }
    fill(flag*100,0,0);
    rect(8*(i%100),8*(i/100),8,8);
  }
}

void stepCnt(int n){
  g=0;
  c=0;
  p=0;
  for(int k=0;k<100;k++){
  
    if(te[k][n]=='G'){
      g++;
    }else if(te[k][n]=='C'){
      c++;
    }else if(te[k][n]=='P'){
      p++;
    }
  }
  if(max(g,c,p)==g){
    te[100][n]='P';
  }else if(max(g,c,p)==c){
    te[100][n]='G';
  }else if(max(g,c,p)==p){
    te[100][n]='C';
  }
}
