import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_application/Models/Task_Model.dart';

class firebaseUtiles{
  static CollectionReference<taskModel> getTasksCollection() => FirebaseFirestore.instance.collection('tasks').withConverter <taskModel>(
    fromFirestore: (snapshot,_) =>
    taskModel.fromJson(snapshot.data()!),
  toFirestore: (taskModel,_) => taskModel.toJson() );

  static Future<void> addTaskToFirestore (taskModel task){
    final tasksCollection = getTasksCollection();
    final doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future <List<taskModel>> getAllTasksFromFirestore() async {
    final tasksCollection = getTasksCollection(); // Replace 'tasks' with your actual collection name
    final querySnapshot = await tasksCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> deleteTaskFromFirestore(String taskId){
    final tasksCollection = getTasksCollection();
    return tasksCollection.doc(taskId).delete();
  }
}




