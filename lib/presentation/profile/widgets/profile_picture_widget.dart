import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/profile/bloc/profile_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final bool isLoading =
            state.fetchProfileStatus == FetchProfileStatus.loading;
        if (state.fetchProfileStatus == FetchProfileStatus.error) {
          return Text(state.dioExceptionTypeFetchProfile.name);
        }

        return Skeletonizer(
          enabled: isLoading,
          child: Column(
            children: [
              Skeleton.replace(
                width: context.widthPct(20),
                height: context.widthPct(20),
                child: Container(
                  width: context.widthPct(20),
                  height: context.widthPct(20),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                ),
              ),
              const Skeleton.keep(child: Text("Name")),
              Text(isLoading ? BoneMock.title : state.name),
              const Skeleton.keep(child: Text("Email")),
              Text(isLoading ? BoneMock.title : state.email),
            ],
          ),
        );
      },
    );
  }
}
