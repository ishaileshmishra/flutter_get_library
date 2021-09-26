# Flutter News App using [Get Library](https://pub.dev/packages/get)

## Getting Started

It's easy for beginners, and accurate for experts

- Getx state manager is easier than using setState
- You just need to add a ".obs" at the end of your variable, and wrap the widget you want to change within a Obx()
- Wrap the widget you want to change within a Obx().

      void main() => runApp(MaterialApp(home: Home()));

      class Home extends StatelessWidget {
        var count = 0.obs;
        @override
        Widget build(context) => Scaffold(
            appBar: AppBar(title: Text("counter")),
            body: Center(
              child: Obx(() => Text("$count")),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => count ++,
            ));
      }

[OR]

- The most common way to do this is to separate the business logic from its visualization
- create a class by extending GetxController and insert ALL your variables and functions there

      class Controller extends GetxController {
        var count = 0;
        void increment() {
          count++;
          update();
        }
      }

call it like below, in your stateless widget

<b>Notice the use of Get.put(Controller()).</b> This is enough to make your controller available to other pages as long as it is in memory

    class Home extends StatelessWidget {
      final controller = Get.put(Controller());
      @override
      Widget build(BuildContext context) {
use it like below, wherever you want to use the result: ```

    GetBuilder<Controller>(
        builder: (_) => Text(
            'clicks: ${controller.count}',
        )),

```Get.to(Second())```, This is enough to navigate to another page. You don't need below code

    Navigator.of(context).push(context, 
    MaterialPageRoute(context, builder: (context){
        return Second();
    },);

for more; visite [website](https://pub.dev/packages/get)

![Alt text](https://raw.githubusercontent.com/jonataslaw/getx-community/master/getx.png "Title")

### (App screenshots)

<img src="assets/image/screen1.jpeg" width=250>  <img src="assets/image/screen2.jpeg" width=250>