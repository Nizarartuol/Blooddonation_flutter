import 'package:flutter/material.dart';
import 'package:new_blood/model/event.dart';
import 'package:path_provider/path_provider.dart';
import 'package:new_blood/widgets/utils.dart';
import 'package:new_blood/provider/event_provider.dart';
import 'package:provider/provider.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;

  const EventEditingPage({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  @override
  void dispose () {
    titleController.dispose();

      super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildEditingActions(),
      ),

    body: SingleChildScrollView(
      padding: EdgeInsets.all(12),
    child: Form(
      key: _formKey,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        buildTitle(),
        SizedBox(height: 12),
        buildDateTimePickers(),
      ],
    ),
    ),
    ),
  );

    List<Widget> buildEditingActions () => [
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: saveForm,
        icon: Icon(Icons.done),
        label: Text('Enregistrer'),

      ),
    ];

    Widget buildTitle() => TextFormField(
      style: TextStyle(fontSize: 24),
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Don de sang',
      ),
      onFieldSubmitted: (_) => saveForm(),
      validator: (title) =>
      title != null && title.isEmpty ? 'Titre ne peut pas être vide' : null,
      controller: titleController,
    );

    Widget buildDateTimePickers() => Column(
      children: [
        buildFrom(),
        buildTo(),
      ],
    );

    Widget buildFrom() => buildHeader(
      header: 'De',
      child: Row(
        children: [
        Expanded(
          flex: 2,
          child: buildDropDownField(
            text:Utils.toDate(fromDate),
            onClicked: () => pickFromDateTime(pickDate: true),
          ),
        ),
        Expanded(
            child: buildDropDownField(
              text: Utils.toTime(fromDate),
              onClicked: () => pickFromDateTime(pickDate: false),
            ),
        ),
      ],
    ),
    );

  Widget buildTo() => buildHeader(
    header: 'à',
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: buildDropDownField(
            text:Utils.toDate(toDate),
            onClicked: () => pickFromDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: buildDropDownField(
            text: Utils.toTime(toDate),
            onClicked: () => pickFromDateTime(pickDate: false),
          ),
        ),
      ],
    ),
  );

  Future pickFromDateTime({required bool pickDate}) async{
    final date = await pickDateTime(
        fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute );
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async{
    final date = await pickDateTime(
        toDate,
        pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );
    if (date == null) return;

    setState(() => toDate = date);
  }




  Future<DateTime?> pickDateTime(
      DateTime initialDate, {
        required bool pickDate,
        DateTime? firstDate,
}) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate:  DateTime(2100),
      );

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    }
    else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
      DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }


    Widget buildDropDownField({
  required String text,
      required VoidCallback onClicked,
}) =>
        ListTile(
          title: Text(text),
          trailing: Icon(Icons.arrow_drop_down),
          onTap: onClicked,
        );

    Widget buildHeader ({
  required String header,
      required Widget child,
}) =>
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(header, style: TextStyle(fontWeight: FontWeight.bold),),
            child,
          ],
        );

    Future saveForm() async {
        final isValid = _formKey.currentState!.validate();

        if (isValid) {
          final event = Event (
            title: titleController.text,
            from: fromDate,
            to: toDate,
            isAllDay: false,
            description: '',
          );

          final provider = Provider.of<EventProvider>(context, listen: false);
          provider.addEvent(event);

          Navigator.of(context).pop();

        }
    }

}
