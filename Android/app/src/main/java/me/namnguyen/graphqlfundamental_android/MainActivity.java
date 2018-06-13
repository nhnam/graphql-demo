package me.namnguyen.graphqlfundamental_android;

import android.app.DownloadManager;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import com.apollographql.apollo.ApolloCall;
import com.apollographql.apollo.ApolloCallback;
import com.apollographql.apollo.ApolloClient;
import com.apollographql.apollo.ApolloQueryCall;
import com.apollographql.apollo.api.Response;
import com.apollographql.apollo.exception.ApolloException;

import javax.annotation.Nonnull;

import okhttp3.Callback;
import okhttp3.OkHttpClient;
import me.namnguyen.api.HelloQuery;

public class MainActivity extends AppCompatActivity {

    private Button fetchButton;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initialize();
    }

    private void initialize() {
        sayHelloToMe();
    }

    private void sayHelloToMe() {
        OkHttpClient okHttpClient = new OkHttpClient.Builder()
                .build();

        ApolloClient client = ApolloClient.builder()
                .serverUrl("localhost:4000/graphql")
                .okHttpClient(okHttpClient)
                .build();


        client.query(HelloQuery.builder().build()).enqueue(new ApolloCall.Callback<HelloQuery.Data>() {
            @Override
            public void onResponse(@Nonnull Response<HelloQuery.Data> response) {
                Log.d("HelloQuery",response.toString());
            }

            @Override
            public void onFailure(@Nonnull ApolloException e) {

            }
        });

    }
}

