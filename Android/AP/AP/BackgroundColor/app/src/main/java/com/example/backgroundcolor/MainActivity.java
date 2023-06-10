package com.example.backgroundcolor;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;

import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    Button b1,b2,b3;
    TextView t1;
    ConstraintLayout bg;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        t1=(TextView) findViewById(R.id.textView);
        b1=(Button) findViewById(R.id.button);
        b2=(Button) findViewById(R.id.button2);
        b3=(Button) findViewById(R.id.button3);
        bg=(ConstraintLayout) findViewById(R.id.abc1);
    }

    public void Teal1(View v){
        bg.setBackgroundResource(R.color.red);
        b1.setBackgroundColor(Color.WHITE);
        b2.setBackgroundColor(Color.BLUE);
        b3.setBackgroundColor(Color.CYAN);
    }
    public void Purp(View v){
        bg.setBackgroundResource(R.color.blue);
        b2.setBackgroundColor(Color.WHITE);
        b1.setBackgroundColor(Color.RED);
        b3.setBackgroundColor(Color.CYAN);
    }
    public void Teal2(View v){
        bg.setBackgroundResource(R.color.cyan);
        b3.setBackgroundColor(Color.WHITE);
        b1.setBackgroundColor(Color.RED);
        b2.setBackgroundColor(Color.BLUE);
    }

}