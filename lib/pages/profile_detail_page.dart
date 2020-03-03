import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_imes/pages/compass.dart';
import 'package:prayer_imes/pages/my_calendar.dart';

class ProfileDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Container(
              child: new Column(
            children: <Widget>[
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: new Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.red
                          ),
                          borderRadius: new BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: AssetImage('assets/image/user/man.png'),
                          ),
                          color: Color(0xFFFD7384)),
                    ),
                  )),
                  new Expanded(
                      child: new Container(
                    height: 100.0,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 2.5, right: 2.5),
                            child: new Container(
                              decoration: new BoxDecoration(
                                  color: Color(0XFF2BD093),
                                  borderRadius: new BorderRadius.circular(5.0)),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: new Icon(
                                      Icons.local_offer,
                                      color: Colors.white,
                                    ),
                                  ),
                                  new Text('Classified',
                                      style: new TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, right: 2.5),
                            child: new Container(
                              decoration: new BoxDecoration(
                                  color: Color(0XFFFC7B4D),
                                  borderRadius: new BorderRadius.circular(5.0)),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: new Icon(
                                      Icons.beenhere,
                                      color: Colors.white,
                                    ),
                                  ),
                                  new Text('Service',
                                      style: new TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  new Expanded(
                      child: new Container(
                    height: 100.0,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 2.5, bottom: 2.5),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Compass()))
                                },
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      color: Color(0XFF53CEDB),
                                      borderRadius:
                                          new BorderRadius.circular(5.0)),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: new Icon(IconData(0xe603,
                                            fontFamily: 'MyIcons')),
                                      ),
                                      new Text('Mecca',
                                          style: new TextStyle(
                                              color: Colors.white))
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        // Compass
                        Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 2.5, top: 2.5),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyCalendar()))
                                },
                                child: Container(
                                  decoration: new BoxDecoration(
                                      color: Color(0XFFF1B069),
                                      borderRadius:
                                          new BorderRadius.circular(5.0)),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: new Icon(
                                          Icons.art_track,
                                          color: Colors.white,
                                        ),
                                      ),
                                      new Text(
                                        'Jobs',
                                        style:
                                            new TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              new SizedBox(
                height: 25.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text("Popular Trending",
                          style: new TextStyle(fontSize: 18.0))),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 96.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Little Butterfly",
                            style: Theme.of(context).textTheme.title,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("Product Designer"),
                            subtitle: Text("Kathmandu"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("285"), Text("Likes")],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("3025"), Text("Comments")],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("650"), Text("Favourites")],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: ListTile(
                  title: Text("setting"),
                  leading: new Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onTap: () => {},
                ),
              ),
              new SizedBox(
                height: 15.0,
              ),
            ],
          )),
        )
      ],
    );
  }
}
