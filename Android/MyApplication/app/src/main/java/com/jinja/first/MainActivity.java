package com.jinja.first;

import androidx.appcompat.app.AppCompatActivity;
import java.util.List;
import android.view.View;
import android.widget.TextView;
import android.os.Bundle;
import android.widget.Button;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    private BeerExpert expert = new BeerExpert();
    static {
       System.loadLibrary("first");
    }
    public void onClickFindBeer(View view)
    {

        TextView brands = (TextView) findViewById(R.id.textView1);
        Spinner color = (Spinner) findViewById(R.id.spinner1);
        Button button1=(Button) findViewById(R.id.button1);
        String beerType=String.valueOf(color.getSelectedItem());
        brands.setText(beerType);

        List<String> brandsList = expert.getBrands(beerType);
        StringBuilder brandsFormatted = new StringBuilder();
        for (String brand : brandsList) {
            brandsFormatted.append(brand).append('\n');
        }
        brands.setText(brandsFormatted);
    }
}