package com.example.spinner;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    ImageView im;
    Spinner s1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        s1=findViewById(R.id.spinner);
        im=findViewById(R.id.imageView);

        ArrayAdapter adapter=ArrayAdapter.createFromResource(MainActivity.this, R.array.spinner, android.R.layout.simple_spinner_item);
        s1.setAdapter(adapter);

        s1.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(position==0){
                    im.setImageResource(R.drawable.img_1);
                    Toast.makeText(MainActivity.this, "Eminem", Toast.LENGTH_SHORT).show();
                }
                else if(position == 1){
                    im.setImageResource(R.drawable.img);
                    Toast.makeText(MainActivity.this, "Krsna", Toast.LENGTH_SHORT).show();
                }
                else if(position==2){
                    im.setImageResource(R.drawable.img_2);
                    Toast.makeText(MainActivity.this, "Kendrick", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }
}