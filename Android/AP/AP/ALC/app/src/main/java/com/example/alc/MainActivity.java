package com.example.alc;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override
    protected void onStart(){
        super.onStart();
        Log.d("onStart","Called");
    }

    @Override
    protected void onResume(){
        super.onResume();
        Log.d("onResume","Called");
    }

    @Override
    protected void onPause(){
        super.onPause();
        Log.d("onPause","Called");
    }

    @Override
    protected void onStop(){
        super.onStop();
        Log.d("onStop","Called");
    }

    @Override
    protected void onRestart(){
        super.onRestart();
        Log.d("onRestart","Called");
    }

    @Override
    protected void onDestroy(){
        super.onDestroy();
        Log.d("onDestroy","Called");
    }
}
