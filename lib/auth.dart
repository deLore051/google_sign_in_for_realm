import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../model/realm_models.dart';

class Auth {
  Auth._internal();
  static final Auth _instance = Auth._internal();

  static Auth get instance => _instance;

  Future<Realm> realmAnonymousLogIn() async {
    // We need to create a late instance of Realm object in case the data sync
    // failes for any reason.
    // And we enter the ClientResetHandler method for flexibleSync but the default
    // RecoverOrDiscardUnsyncedChangesHandler method failes, and we to enter in
    // the onManualResetFallback method, we can do a resetRealm().
    late Realm realm;

    // The App client is the interface to the Atlas App Services backend. It
    // provides access to the authentication and device sync methods.
    // Every App has a unique ID. We use the App IDs to specify which app we
    // want to use or modify. You can find the App ID you need when you log in to
    // MongoDB website -> App Services -> Select App -> You will se it in the
    // upper left side of the screen and copy it from there.
    final app = App(AppConfiguration("trackme_app-cozgg"));

    // Check if the user is currently logged in, if not log in anonymously.
    final user = app.currentUser ?? await app.logIn(Credentials.anonymous());

    // Create a schema list for all Realm Models that we will use further.
    final List<SchemaObject> schema = [
      Company.schema,
      Worker.schema,
      Job.schema,
      Operation.schema
    ];

    final config = Configuration.flexibleSync(
      user,
      schema,
      syncErrorHandler: (SyncError error) {
        debugPrint("In syncErrorHandler");
        debugPrint("Sync error detailed message: ${error.detailedMessage}");
        debugPrint("Sync error message: ${error.message}");
        realm.refresh();
      },
      clientResetHandler: RecoverOrDiscardUnsyncedChangesHandler(
        onManualResetFallback: (clientResetError) {
          debugPrint("In ManualRecoveryHandler");
          realm.close();
          try {
            clientResetError.resetRealm()
                ? debugPrint("Success")
                : debugPrint("Faliure");
          } catch (err) {
            debugPrint("resetRealm failed");
          }
        },
      ),
    );

    realm = Realm(config);
    // Adding subscriptions for collections on mongo-db
    //from which we want to pull data.
    realm.syncSession.waitForDownload();

    realm.refresh();

    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<Company>());
      mutableSubscriptions.add(realm.all<Worker>());
      mutableSubscriptions.add(realm.all<Job>());
      mutableSubscriptions.add(realm.all<Operation>());
    });

    return realm;
  }

  Future<Realm> realmSignInWithGoogle(
      Credentials googleAuthCodeCredentials) async {
    late Realm realm;
    final app = App(AppConfiguration("trackme_app-cozgg"));

    debugPrint("Entered realmSignInWithGoogle function");
    // Check if the user is currently logged in, if not log in anonymously.
    final user = app.currentUser ?? await app.logIn(googleAuthCodeCredentials);

    // Create a schema list for all Realm Models that we will use further.
    final List<SchemaObject> schema = [
      Company.schema,
      Worker.schema,
      Job.schema,
      Operation.schema
    ];

    final config = Configuration.flexibleSync(
      user,
      schema,
      syncErrorHandler: (SyncError error) {
        debugPrint("In syncErrorHandler");
        debugPrint("Sync error detailed message: ${error.detailedMessage}");
        debugPrint("Sync error message: ${error.message}");
        realm.refresh();
      },
      clientResetHandler: RecoverOrDiscardUnsyncedChangesHandler(
        onManualResetFallback: (clientResetError) {
          debugPrint("In ManualRecoveryHandler");
          realm.close();
          try {
            clientResetError.resetRealm()
                ? debugPrint("Success")
                : debugPrint("Faliure");
          } catch (err) {
            debugPrint("resetRealm failed");
          }
        },
      ),
    );

    realm = Realm(config);
    // Adding subscriptions for collections on mongo-db
    //from which we want to pull data.
    realm.syncSession.waitForDownload();

    realm.refresh();

    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<Company>());
      mutableSubscriptions.add(realm.all<Worker>());
      mutableSubscriptions.add(realm.all<Job>());
      mutableSubscriptions.add(realm.all<Operation>());
    });

    return realm;
  }
}
