package jinja.comicmaster;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void onClickRcc(View view){
        Intent intent =new Intent(this,ReadComicOnline.class);
        startActivity(intent);
    }
    public void onClickWebtoons(View view){
        Intent intent =new Intent(this,Webtoons.class);
        startActivity(intent);
    }


}